// lib/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class AddBasicFilter extends Bloc<FilterEventAddBasic, FilterStateAddBasic> {
  final FamilyDropRepository repository;

  AddBasicFilter({
    required List<FilterStep> steps,
    required this.repository,
  }) : super(FilterStateAddBasic(steps: steps)) {
    on<LoadFilterDataEvent>(_onLoadFilterData);
    on<ChangeStepEvent>(_onChangeStep);
    on<SelectOptionEvent>(_onSelectOption);
    on<ClearAllSelectionsEvent>(_onClearAll);
    on<NextStepEvent>(_onNextStep);
    on<SubmitAddFilterSubmitEvent>(_onSubmit);

    add(LoadFilterDataEvent());
  }

  Future<void> _onLoadFilterData(
    LoadFilterDataEvent event,
    Emitter<FilterStateAddBasic> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final updatedSteps = <FilterStep>[];

      for (final step in state.steps) {
        if (step.position == -1) {
          // Static options - keep as is
          updatedSteps.add(step);
        } else {
          // Fetch from API and convert to FilterOption
          List<FilterOption> apiOptions = [];

          try {
            switch (step.position) {
              case 2: // House Types
                final items = await repository.getHouseTypes();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              case 3: // Land Types
                final items = await repository.getLandTypes();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              case 4: // Water Facilities
                final items = await repository.getWaterFacilities();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              case 5: // Required Benefits
                final items = await repository.getRequiredBenefits();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              case 6: // Other Benefits
                final items = await repository.getOtherBenefits();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              case 7: // Ward General Needs
                final items = await repository.getWardGeneralNeeds();
                apiOptions = items
                    .map((e) => FilterOption(id: e.id, name: e.name))
                    .toList();
                break;
              default:
                apiOptions = step.options;
            }

            updatedSteps.add(step.copyWith(options: apiOptions));
          } catch (e) {
            updatedSteps.add(step);
          }
        }
      }

      emit(state.copyWith(
        steps: updatedSteps,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to load filter data: ${e.toString()}',
      ));
    }
  }

  void _onChangeStep(
    ChangeStepEvent event,
    Emitter<FilterStateAddBasic> emit,
  ) {
    emit(state.copyWith(currentStep: event.stepIndex));
  }

  void _onSelectOption(
    SelectOptionEvent event,
    Emitter<FilterStateAddBasic> emit,
  ) {
    final step = state.steps[event.stepIndex]; // 👈 get step
    final newSelections = Map<String, String>.from(state.selections);

    // ✅ STORE ENGLISH KEY
    newSelections[step.key] = event.optionId;

    emit(state.copyWith(selections: newSelections));
  }

  void _onClearAll(
    ClearAllSelectionsEvent event,
    Emitter<FilterStateAddBasic> emit,
  ) {
    emit(state.copyWith(selections: {}));
  }

  void _onNextStep(
    NextStepEvent event,
    Emitter<FilterStateAddBasic> emit,
  ) {
    if (!state.isLastStep) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onSubmit(
    SubmitAddFilterSubmitEvent event,
    Emitter<FilterStateAddBasic> emit,
  ) {}
}
