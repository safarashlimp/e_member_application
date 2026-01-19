// import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
// import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_event.dart';
// import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddBasicFilter extends Bloc<AddFilterSubmitEvent, FilterStateAddBasic> {
//   AddBasicFilter({required List<FilterStep> steps})
//       : super(FilterStateAddBasic(
//           currentStep: 0,
//           selections: {for (var step in steps) step.name: null},
//           steps: steps,
//         )) {
//     on<ChangeStepEvent>(_onChangeStep);
//     on<SelectOptionEvent>(_onSelectOption);
//     on<NextStepEvent>(_onNextStep);
//     on<PreviousStepEvent>(_onPreviousStep);
//     on<ClearAllSelectionsEvent>(_onClearAllSelections);
//     on<SubmitAddFilterSubmitEvent>(_onSubmitFilter);
//   }

//   void _onChangeStep(ChangeStepEvent event, Emitter<FilterStateAddBasic> emit) {
//     emit(state.copyWith(currentStep: event.stepIndex));
//   }

//   void _onSelectOption(SelectOptionEvent event, Emitter<FilterStateAddBasic> emit) {
//     final newSelections = Map<String, String?>.from(state.selections);
//     newSelections[event.stepName] = event.option;
//     emit(state.copyWith(selections: newSelections));
//   }

//   void _onNextStep(NextStepEvent event, Emitter<FilterStateAddBasic> emit) {
//     if (!state.isLastStep) {
//       emit(state.copyWith(currentStep: state.currentStep + 1));
//     }
//   }

//   void _onPreviousStep(PreviousStepEvent event, Emitter<FilterStateAddBasic> emit) {
//     if (!state.isFirstStep) {
//       emit(state.copyWith(currentStep: state.currentStep - 1));
//     }
//   }

//   void _onClearAllSelections(
//       ClearAllSelectionsEvent event, Emitter<FilterStateAddBasic> emit) {
//     final clearedSelections = {for (var step in state.steps) step.name: null};
//     emit(state.copyWith(
//       selections: clearedSelections,
//       currentStep: 0,
//     ));
//   }

//   void _onSubmitFilter(SubmitAddFilterSubmitEvent event, Emitter<FilterStateAddBasic> emit) {
//     emit(state.copyWith(isSubmitting: true));

//     print("this is submition");
//     // Add your submit logic here
//     print('Selections: ${state.selections}');
//     emit(state.copyWith(isSubmitting: false));
//   }
// }
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

    // Auto-load data when bloc is created
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
          // Fetch from API based on position
          List<String> apiOptions = [];

          try {
            switch (step.position) {
              case 2: // House Types
                final items = await repository.getHouseTypes();
                apiOptions = items.map((e) => e.name).toList();
                break;
              case 3: // Land Types
                final items = await repository.getLandTypes();
                apiOptions = items.map((e) => e.name).toList();
                break;
              case 4: // Water Facilities
                final items = await repository.getWaterFacilities();
                apiOptions = items.map((e) => e.name).toList();
                break;
              case 5: // Required Benefits (ലഭിച്ച ആനുകൂല്യം)
                final items = await repository.getRequiredBenefits();
                apiOptions = items.map((e) => e.name).toList();
                break;
              case 6: // Other Benefits (ആവശ്യമുള്ള ആനുകൂല്യം)
                final items = await repository.getOtherBenefits();
                apiOptions = items.map((e) => e.name).toList();
                break;
              case 7: // Ward General Needs
                final items = await repository.getWardGeneralNeeds();
                apiOptions = items.map((e) => e.name).toList();
                break;
              default:
                apiOptions = step.options;
            }

            updatedSteps.add(step.copyWith(options: apiOptions));
          } catch (e) {
            // If API fails for this step, keep original options
            print('Failed to load data for ${step.name}: $e');
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
    final newSelections = Map<String, String>.from(state.selections);
    newSelections[event.stepName] = event.option;
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
  ) {
    // Handle submit logic here
    print("Filter selections: ${state.selections}");
    // You can add navigation or callback logic here
  }
}