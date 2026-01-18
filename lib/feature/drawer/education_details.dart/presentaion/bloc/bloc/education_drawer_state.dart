
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_entity.dart';

enum EducationDrawerStatus { initial, loading, success, error }

class EducationDrawerState {
  final int currentStep;
  final EducationFilter filter;
  final EducationDrawerStatus status;
  final String? errorMessage;

  const EducationDrawerState({
    this.currentStep = 0,
    this.filter = const EducationFilter(),
    this.status = EducationDrawerStatus.initial,
    this.errorMessage,
  });

  EducationDrawerState copyWith({
    int? currentStep,
    EducationFilter? filter,
    EducationDrawerStatus? status,
    String? errorMessage,
  }) {
    return EducationDrawerState(
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get canGoNext => currentStep < 1; // Only 2 steps (0 and 1)
  bool get canGoPrevious => currentStep > 0;
  
  String? getCurrentSelection() {
    switch (currentStep) {
      case 0:
        return filter.educationalQualification;
      case 1:
        return filter.currentlyStudying;
      default:
        return null;
    }
  }
}