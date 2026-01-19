// lib/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_state.dart
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_entity.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_filter_step.dart';

enum EducationDrawerStatus {
  initial,
  loading,
  success,
  error,
}

class EducationDrawerState {
  final List<EducationFilterStep> steps;
  final int currentStep;
  final EducationFilter filter;
  final EducationDrawerStatus status;
  final String? errorMessage;
  final bool isLoadingData;

  const EducationDrawerState({
    this.steps = const [],
    this.currentStep = 0,
    this.filter = const EducationFilter(),
    this.status = EducationDrawerStatus.initial,
    this.errorMessage,
    this.isLoadingData = false,
  });

  String get currentStepName => steps.isNotEmpty ? steps[currentStep].name : '';
  
  List<dynamic> get currentOptions => steps.isNotEmpty ? steps[currentStep].options : [];

  String? getCurrentSelection() {
    if (steps.isEmpty) return null;
    
    final stepName = currentStepName;
    switch (stepName) {
      case 'വിദ്യാഭ്യാസ യോഗ്യത':
        return filter.educationalQualificationId;
      case 'ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ':
        return filter.currentlyStudyingId;
      default:
        return null;
    }
  }

  // Get display name for selected ID
  String? getCurrentSelectionName() {
    final id = getCurrentSelection();
    if (id == null || currentOptions.isEmpty) return null;
    
    try {
      return currentOptions.firstWhere((opt) => opt.id == id).name;
    } catch (e) {
      return null;
    }
  }

  bool get canGoNext => currentStep < steps.length - 1;
  bool get canGoPrevious => currentStep > 0;

  EducationDrawerState copyWith({
    List<EducationFilterStep>? steps,
    int? currentStep,
    EducationFilter? filter,
    EducationDrawerStatus? status,
    String? errorMessage,
    bool? isLoadingData,
  }) {
    return EducationDrawerState(
      steps: steps ?? this.steps,
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingData: isLoadingData ?? this.isLoadingData,
    );
  }
}