import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/ussecase/submit_filter.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_event.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_state.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';

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
    on<ClearAllFilters>(_onClearAllFilters);
    on<SubmitFilterEvent>(_onSubmitFilters);
  }

  Future<void> _onLoadFilters(
    LoadFilters event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(status: FilterStatus.loading));
    
    try {
      final options = await getFilterOptions();
      
      final initialSelections = <String, String?>{};
      for (final option in options) {
        initialSelections[option.id] = null;
      }
      
      emit(state.copyWith(
        status: FilterStatus.loaded,
        filterOptions: options,
        selections: FilterSelection(selections: initialSelections),
        currentStep: 0,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FilterStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onChangeStep(ChangeStep event, Emitter<FilterState> emit) {
    if (event.stepIndex >= 0 && event.stepIndex < state.filterOptions.length) {
      emit(state.copyWith(currentStep: event.stepIndex));
    }
  }

  void _onSelectOption(SelectOption event, Emitter<FilterState> emit) {
    final updatedSelections = Map<String, String?>.from(
      state.selections.selections,
    );
    updatedSelections[event.filterKey] = event.option;

    emit(state.copyWith(
      selections: FilterSelection(selections: updatedSelections),
    ));
  }

  void _onClearAllFilters(ClearAllFilters event, Emitter<FilterState> emit) {
    final clearedSelections = <String, String?>{};
    for (final option in state.filterOptions) {
      clearedSelections[option.id] = null;
    }

    emit(state.copyWith(
      selections: FilterSelection(selections: clearedSelections),
    ));
  }

  Future<void> _onSubmitFilters(
    SubmitFilterEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(status: FilterStatus.submitting));
    
    try {
      await submitFilters(state.selections, state.filterOptions);
      emit(state.copyWith(status: FilterStatus.submitted));
    } catch (e) {
      emit(state.copyWith(
        status: FilterStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}