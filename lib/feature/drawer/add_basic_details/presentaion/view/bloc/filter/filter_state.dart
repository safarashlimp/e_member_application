// import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';

// class FilterStateAddBasic {
//   final int currentStep;
//   final Map<String, String?> selections;
//   final List<FilterStep> steps;
//   final bool isSubmitting;

//   FilterStateAddBasic({
//     required this.currentStep,
//     required this.selections,
//     required this.steps,
//     this.isSubmitting = false,
//   });

//   FilterStateAddBasic copyWith({
//     int? currentStep,
//     Map<String, String?>? selections,
//     List<FilterStep>? steps,
//     bool? isSubmitting,
//   }) {
//     return FilterStateAddBasic(
//       currentStep: currentStep ?? this.currentStep,
//       selections: selections ?? Map.from(this.selections),
//       steps: steps ?? this.steps,
//       isSubmitting: isSubmitting ?? this.isSubmitting,
//     );
//   }

//   String get currentStepName => steps[currentStep].name;
//   List<String> get currentOptions => steps[currentStep].options;
//   String? get currentSelection => selections[currentStepName];
//   bool get hasSelection => currentSelection != null;
//   bool get isFirstStep => currentStep == 0;
//   bool get isLastStep => currentStep == steps.length - 1;
// }

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
  List<String> get currentOptions => steps[currentStep].options;
  String? get currentSelection => selections[currentStepName];
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