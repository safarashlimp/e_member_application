import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/ussecase/submit_filter.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_event.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final GetFilterOptions getFilterOptions;
  final SubmitFilters submitFilters;

  FilterBloc({
    required this.getFilterOptions,
    required this.submitFilters,
  }) : super(FilterState.initial()) {
    on<LoadFilters>(_onLoadFilters);
    on<ChangeStep>(_onChangeStep);
    on<SelectOption>(_onSelectOption);
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
    on<ClearAllFilters>(_onClearAllFilters);
    on<SubmitFilterEvent>(_onSubmitFilters);
  }

  void _onLoadFilters(LoadFilters event, Emitter<FilterState> emit) {
    emit(state.copyWith(status: FilterStatus.loading));
    
    final options = getFilterOptions();
    final Map<String, String?> initialSelections = {};
    for (var option in options) {
      initialSelections[option.id] = null;
    }
    
    emit(state.copyWith(
      status: FilterStatus.loaded,
      filterOptions: options,
      selections: FilterSelection(selections: initialSelections),
    ));
  }

  void _onChangeStep(ChangeStep event, Emitter<FilterState> emit) {
    if (event.stepIndex >= 0 && event.stepIndex < state.filterOptions.length) {
      emit(state.copyWith(currentStep: event.stepIndex));
    }
  }

  void _onSelectOption(SelectOption event, Emitter<FilterState> emit) {
    final updatedSelections = state.selections.updateSelection(
      event.filterKey,
      event.option,
    );
    emit(state.copyWith(selections: updatedSelections));
  }

  void _onNextStep(NextStep event, Emitter<FilterState> emit) {
    if (!state.isLastStep) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(PreviousStep event, Emitter<FilterState> emit) {
    if (!state.isFirstStep) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onClearAllFilters(ClearAllFilters event, Emitter<FilterState> emit) {
    final clearedSelections = state.selections.clearAll();
    emit(state.copyWith(selections: clearedSelections));
  }

  Future<void> _onSubmitFilters(
    SubmitFilterEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(status: FilterStatus.submitting));
    
    try {
      await submitFilters(state.selections);
       print("submiton is sucess");
      print(state.selections);
      emit(state.copyWith(status: FilterStatus.submitted));
    } catch (e) {
      emit(state.copyWith(
        status: FilterStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}