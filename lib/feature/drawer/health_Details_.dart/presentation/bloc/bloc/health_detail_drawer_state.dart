import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_filter_step.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';

enum HealthDrawerStatus { initial, loading, loaded, success, error }

class HealthDrawerState {
  final HealthDrawerStatus status;
  final int currentStep;
  final HealthDrawerFilter filter;
  final List<HealthFilterStep> steps;
  final String? errorMessage;

  const HealthDrawerState({
    this.status = HealthDrawerStatus.initial,
    this.currentStep = 0,
    this.filter = const HealthDrawerFilter(),
    this.steps = const [],
    this.errorMessage,
  });

  bool get canGoNext => currentStep < steps.length - 1;
  bool get canGoPrevious => currentStep > 0;

  String? getCurrentSelection() {
    if (steps.isEmpty || currentStep >= steps.length) return null;

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

  HealthDrawerState copyWith({
    HealthDrawerStatus? status,
    int? currentStep,
    HealthDrawerFilter? filter,
    List<HealthFilterStep>? steps,
    String? errorMessage,
  }) {
    return HealthDrawerState(
      status: status ?? this.status,
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      steps: steps ?? this.steps,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
