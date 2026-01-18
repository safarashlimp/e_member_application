import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';

enum JobDetailsDrawerStatus { initial, loading, success, error }

class JobDetailsDrawerState {
  final int currentStep;
  final JobDetailsFilter filter;
  final JobDetailsDrawerStatus status;
  final String? errorMessage;

  const JobDetailsDrawerState({
    this.currentStep = 0,
    this.filter = const JobDetailsFilter(),
    this.status = JobDetailsDrawerStatus.initial,
    this.errorMessage,
  });

  JobDetailsDrawerState copyWith({
    int? currentStep,
    JobDetailsFilter? filter,
    JobDetailsDrawerStatus? status,
    String? errorMessage,
  }) {
    return JobDetailsDrawerState(
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get canGoNext => currentStep < 2; // 3 steps (0, 1, 2)
  bool get canGoPrevious => currentStep > 0;
  
  String? getCurrentSelection() {
    switch (currentStep) {
      case 0:
        return filter.employmentStatus;
      case 1:
        return filter.occupation;
      case 2:
        return filter.needEmploymentHelp;
      default:
        return null;
    }
  }
}