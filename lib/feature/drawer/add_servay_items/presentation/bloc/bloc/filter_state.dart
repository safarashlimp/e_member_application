import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';

enum FilterStatus { initial, loading, loaded, submitting, submitted, error }

class FilterState {
  final FilterStatus status;
  final List<FilterOption> filterOptions;
  final FilterSelection selections;
  final int currentStep;
  final String? errorMessage;
  final Map<String, dynamic>? filterPayload;

  const FilterState({
    required this.status,
    required this.filterOptions,
    required this.selections,
    required this.currentStep,
    this.errorMessage,
    this.filterPayload,
  });

  // Factory constructor for initial state
  factory FilterState.initial() {
    return const FilterState(
      status: FilterStatus.initial,
      filterOptions: [],
      selections: FilterSelection(selections: {}),
      currentStep: 0,
      errorMessage: null,
      filterPayload: null,
    );
  }

  FilterState copyWith({
    FilterStatus? status,
    List<FilterOption>? filterOptions,
    FilterSelection? selections,
    int? currentStep,
    String? errorMessage,
    Map<String, dynamic>? filterPayload,
  }) {
    return FilterState(
      status: status ?? this.status,
      filterOptions: filterOptions ?? this.filterOptions,
      selections: selections ?? this.selections,
      currentStep: currentStep ?? this.currentStep,
      errorMessage: errorMessage ?? this.errorMessage,
      filterPayload: filterPayload ?? this.filterPayload,
    );
  }

  // Safe getters with fallback
  FilterOption? get currentFilterOrNull => 
      filterOptions.isNotEmpty && currentStep < filterOptions.length
          ? filterOptions[currentStep]
          : null;

  FilterOption get currentFilter {
    if (filterOptions.isEmpty) {
      throw StateError('No filter options available');
    }
    if (currentStep >= filterOptions.length) {
      throw StateError('Current step index out of bounds');
    }
    return filterOptions[currentStep];
  }

  String? get currentSelection {
    final filter = currentFilterOrNull;
    return filter != null ? selections.selections[filter.id] : null;
  }

  bool get isLastStep => 
      filterOptions.isNotEmpty && currentStep == filterOptions.length - 1;
  
  bool get isFirstStep => currentStep == 0;
}