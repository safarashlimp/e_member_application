// lib/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_bloc.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_filter_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_entity.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/constant/education_constants.dart';
import 'education_drawer_event.dart';
import 'education_drawer_state.dart';

class EducationDrawerBloc extends Bloc<EducationDrawerEvent, EducationDrawerState> {
  final MemberDropRepository repository;

  EducationDrawerBloc({required this.repository})
      : super(EducationDrawerState(steps: EducationConstants.steps)) {
    on<LoadEducationFilterData>(_onLoadFilterData);
    on<EducationDrawerStepChanged>(_onStepChanged);
    on<EducationDrawerOptionSelected>(_onOptionSelected);
    on<EducationDrawerNextStep>(_onNextStep);
    on<EducationDrawerPreviousStep>(_onPreviousStep);
    on<EducationDrawerReset>(_onReset);
    on<EducationDrawerSubmit>(_onSubmit);

    // Auto-load data
    add(const LoadEducationFilterData());
  }

  Future<void> _onLoadFilterData(
    LoadEducationFilterData event,
    Emitter<EducationDrawerState> emit,
  ) async {
    emit(state.copyWith(isLoadingData: true));

    try {
      final updatedSteps = <EducationFilterStep>[];

      for (final step in state.steps) {
        if (step.position == -1) {
          // Static options (Yes/No)
          updatedSteps.add(step);
        } else {
          // Fetch from API
          List<FilterOption> apiOptions = [];

          try {
            switch (step.position) {
              case 6: // Educational Qualification
                final items = await repository.getQualifications();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              case 7: // Education List (if needed)
                final items = await repository.getEducationList();
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
      }

      emit(state.copyWith(
        steps: updatedSteps,
        isLoadingData: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingData: false,
        status: EducationDrawerStatus.error,
        errorMessage: 'Failed to load filter data: ${e.toString()}',
      ));
    }
  }

  void _onStepChanged(
    EducationDrawerStepChanged event,
    Emitter<EducationDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < state.steps.length) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    EducationDrawerOptionSelected event,
    Emitter<EducationDrawerState> emit,
  ) {
    EducationFilter updatedFilter;

    // Store ID instead of name
    switch (event.filterKey) {
      case 'വിദ്യാഭ്യാസ യോഗ്യത':
        updatedFilter = state.filter.copyWith(
          educationalQualificationId: event.optionId,
        );
        break;
      case 'ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ':
        updatedFilter = state.filter.copyWith(
          currentlyStudyingId: event.optionId, // Will be "1" or "0"
        );
        break;
      default:
        return;
    }

    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    EducationDrawerNextStep event,
    Emitter<EducationDrawerState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    EducationDrawerPreviousStep event,
    Emitter<EducationDrawerState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    EducationDrawerReset event,
    Emitter<EducationDrawerState> emit,
  ) {
    emit(EducationDrawerState(steps: state.steps));
  }

  void _onSubmit(
    EducationDrawerSubmit event,
    Emitter<EducationDrawerState> emit,
  ) {
    emit(state.copyWith(status: EducationDrawerStatus.loading));

    try {
      // Print IDs that will be sent to backend
      print('Education Filter IDs: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: EducationDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: EducationDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}