import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_event.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBasicFilter extends Bloc<AddFilterSubmitEvent, FilterStateAddBasic> {
  AddBasicFilter({required List<FilterStep> steps})
      : super(FilterStateAddBasic(
          currentStep: 0,
          selections: {for (var step in steps) step.name: null},
          steps: steps,
        )) {
    on<ChangeStepEvent>(_onChangeStep);
    on<SelectOptionEvent>(_onSelectOption);
    on<NextStepEvent>(_onNextStep);
    on<PreviousStepEvent>(_onPreviousStep);
    on<ClearAllSelectionsEvent>(_onClearAllSelections);
    on<SubmitAddFilterSubmitEvent>(_onSubmitFilter);
  }

  void _onChangeStep(ChangeStepEvent event, Emitter<FilterStateAddBasic> emit) {
    emit(state.copyWith(currentStep: event.stepIndex));
  }

  void _onSelectOption(SelectOptionEvent event, Emitter<FilterStateAddBasic> emit) {
    final newSelections = Map<String, String?>.from(state.selections);
    newSelections[event.stepName] = event.option;
    emit(state.copyWith(selections: newSelections));
  }

  void _onNextStep(NextStepEvent event, Emitter<FilterStateAddBasic> emit) {
    if (!state.isLastStep) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(PreviousStepEvent event, Emitter<FilterStateAddBasic> emit) {
    if (!state.isFirstStep) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onClearAllSelections(
      ClearAllSelectionsEvent event, Emitter<FilterStateAddBasic> emit) {
    final clearedSelections = {for (var step in state.steps) step.name: null};
    emit(state.copyWith(
      selections: clearedSelections,
      currentStep: 0,
    ));
  }

  void _onSubmitFilter(SubmitAddFilterSubmitEvent event, Emitter<FilterStateAddBasic> emit) {
    emit(state.copyWith(isSubmitting: true));
    // Add your submit logic here
    print('Selections: ${state.selections}');
    emit(state.copyWith(isSubmitting: false));
  }
}
