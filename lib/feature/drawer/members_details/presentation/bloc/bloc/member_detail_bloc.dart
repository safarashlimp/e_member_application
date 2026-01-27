// lib/feature/drawer/members_details/presentation/bloc/bloc/member_detail_bloc.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_filter_step.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/constats/member_details_constat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_details_filter.dart';

import 'member_detail_event.dart';
import 'member_detail_state.dart';

class MemberDetailsBloc extends Bloc<MemberDetailsEvent, MemberDetailsState> {
  final MemberDropRepository repository;

  MemberDetailsBloc({required this.repository})
      : super(MemberDetailsState(steps: MemberDetailsConstants.steps)) {
    on<LoadMemberFilterData>(_onLoadFilterData);
    on<MemberDetailsStepChanged>(_onStepChanged);
    on<MemberDetailsOptionSelected>(_onOptionSelected);
    on<MemberDetailsNextStep>(_onNextStep);
    on<MemberDetailsPreviousStep>(_onPreviousStep);
    on<MemberDetailsReset>(_onReset);
    on<MemberDetailsSubmit>(_onSubmit);

    // Auto-load data on creation
    add(const LoadMemberFilterData());
  }

  Future<void> _onLoadFilterData(
    LoadMemberFilterData event,
    Emitter<MemberDetailsState> emit,
  ) async {
    emit(state.copyWith(isLoadingData: true));

    try {
      final updatedSteps = <MemberFilterStep>[];

      for (final step in state.steps) {
        List<FilterOption> apiOptions = [];

        try {
          switch (step.position) {
            case 100: // Blood Group (special API)
              final items = await repository.getBloodGroups();
              apiOptions = items
                  .map((e) => FilterOption(id: e.id, name: e.name))
                  .toList();
              break;
            case 2: // Gender
              final items = await repository.getGender();
              apiOptions = items
                  .map((e) => FilterOption(id: e.id, name: e.name))
                  .toList();
              break;
            case 3: // Marital Status
              final items = await repository.getMaritalStatus();
              apiOptions = items
                  .map((e) => FilterOption(id: e.id, name: e.name))
                  .toList();
              break;
            case 4: // Religion
              final items = await repository.getReligion();
              apiOptions = items
                  .map((e) => FilterOption(id: e.id, name: e.name))
                  .toList();
              break;
            case 5: // Caste
              final items = await repository.getCastes();
              apiOptions = items
                  .map((e) => FilterOption(id: e.id, name: e.name))
                  .toList();
              break;
            default:
              apiOptions = step.options.cast<FilterOption>();
          }

          updatedSteps.add(step.copyWith(options: apiOptions));
        } catch (e) {
          print('Failed to load data for ${step.name}: $e');
          updatedSteps.add(step);
        }
      }

      emit(state.copyWith(
        steps: updatedSteps,
        isLoadingData: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingData: false,
        status: MemberDetailsStatus.error,
        errorMessage: 'Failed to load filter data: ${e.toString()}',
      ));
    }
  }

  void _onStepChanged(
    MemberDetailsStepChanged event,
    Emitter<MemberDetailsState> emit,
  ) {
    if (event.step >= 0 && event.step < state.steps.length) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    MemberDetailsOptionSelected event,
    Emitter<MemberDetailsState> emit,
  ) {
    MemberDetailsFilter updatedFilter;

    // Store ID instead of name
    switch (event.filterKey) {
      case 'രക്തഗ്രൂപ്പ്':
        updatedFilter = state.filter.copyWith(bloodGroupId: event.optionId);
        break;
      case 'ലിംഗം':
        updatedFilter = state.filter.copyWith(genderId: event.optionId);
        break;
      case 'വിവാഹസ്ഥിതി':
        updatedFilter = state.filter.copyWith(maritalStatusId: event.optionId);
        break;
      case 'മതം':
        updatedFilter = state.filter.copyWith(religionId: event.optionId);
        break;
      case 'ജാതി':
        updatedFilter = state.filter.copyWith(casteId: event.optionId);
        break;
      default:
        return;
    }

    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    MemberDetailsNextStep event,
    Emitter<MemberDetailsState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    MemberDetailsPreviousStep event,
    Emitter<MemberDetailsState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    MemberDetailsReset event,
    Emitter<MemberDetailsState> emit,
  ) {
    emit(MemberDetailsState(steps: state.steps));
  }

  void _onSubmit(
    MemberDetailsSubmit event,
    Emitter<MemberDetailsState> emit,
  ) {
    emit(state.copyWith(status: MemberDetailsStatus.loading));

    try {
      // Print IDs that will be sent to backend
      print('Member Details Filter IDs: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: MemberDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: MemberDetailsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}