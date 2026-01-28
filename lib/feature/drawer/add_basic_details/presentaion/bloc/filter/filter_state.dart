// lib/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_state.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';

class FilterStateAddBasic {
  final List<FilterStep> steps;
  final int currentStep;
  final Map<String, String> selections; 
  final bool isLoading;
  final String? error;

  FilterStateAddBasic({
    required this.steps,
    this.currentStep = 0,
    this.selections = const {},
    this.isLoading = false,
    this.error,
  });

  String get currentStepName => steps[currentStep].name;
  List<FilterOption> get currentOptions => steps[currentStep].options;
  
  // Get selected ID
  String? get currentSelectionId => selections[currentStepName];
  
  // Get selected option name for display
  String? get currentSelectionName {
    final id = selections[currentStepName];
    if (id == null) return null;
    
    try {
      return currentOptions.firstWhere((opt) => opt.id == id).name;
    } catch (e) {
      return null;
    }
  }
  
  bool get hasSelection => selections.isNotEmpty;
  bool get isLastStep => currentStep == steps.length - 1;

  FilterStateAddBasic copyWith({
    List<FilterStep>? steps,
    int? currentStep,
    Map<String, String>? selections,
    bool? isLoading,
    String? error,
  }) {
    return FilterStateAddBasic(
      steps: steps ?? this.steps,
      currentStep: currentStep ?? this.currentStep,
      selections: selections ?? this.selections,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}