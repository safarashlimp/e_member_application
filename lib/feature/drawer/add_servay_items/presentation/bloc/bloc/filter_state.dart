import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';

enum FilterStatus { initial, loading, loaded, submitting, submitted, error }

class FilterState {
  final FilterStatus status;
  final List<FilterOption> filterOptions;
  final FilterSelection selections;
  final int currentStep;
  final String? errorMessage;

  const FilterState({
    required this.status,
    required this.filterOptions,
    required this.selections,
    required this.currentStep,
    this.errorMessage,
  });

  factory FilterState.initial() {
    return const FilterState(
      status: FilterStatus.initial,
      filterOptions: [],
      selections: FilterSelection(selections: {}),
      currentStep: 0,
    );
  }

  FilterState copyWith({
    FilterStatus? status,
    List<FilterOption>? filterOptions,
    FilterSelection? selections,
    int? currentStep,
    String? errorMessage,
  }) {
    return FilterState(
      status: status ?? this.status,
      filterOptions: filterOptions ?? this.filterOptions,
      selections: selections ?? this.selections,
      currentStep: currentStep ?? this.currentStep,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  FilterOption get currentFilter => filterOptions[currentStep];
  String? get currentSelection => selections.selections[currentFilter.id];
  bool get isLastStep => currentStep == filterOptions.length - 1;
  bool get isFirstStep => currentStep == 0;
}
