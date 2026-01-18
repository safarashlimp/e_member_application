import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';

enum HealthDrawerStatus { initial, loading, success, error }

class HealthDrawerState {
  final int currentStep;
  final HealthDrawerFilter filter;
  final HealthDrawerStatus status;
  final String? errorMessage;

  const HealthDrawerState({
    this.currentStep = 0,
    this.filter = const HealthDrawerFilter(),
    this.status = HealthDrawerStatus.initial,
    this.errorMessage,
  });

  HealthDrawerState copyWith({
    int? currentStep,
    HealthDrawerFilter? filter,
    HealthDrawerStatus? status,
    String? errorMessage,
  }) {
    return HealthDrawerState(
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get canGoNext => currentStep < 4; // 5 steps (0, 1, 2, 3, 4)
  bool get canGoPrevious => currentStep > 0;
  
  String? getCurrentSelection() {
    switch (currentStep) {
      case 0:
        return filter.isPatient;
      case 1:
        return filter.hasDisability;
      case 2:
        return filter.receivesGovernmentBenefits;
      case 3:
        return filter.hasHealthInsurance;
      case 4:
        return filter.requiredHealthAssistance;
      default:
        return null;
    }
  }
}