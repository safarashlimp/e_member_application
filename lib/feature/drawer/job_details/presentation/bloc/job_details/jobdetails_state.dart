// lib/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_state.dart

import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';
import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_fitlre_step.dart';

enum JobDetailsDrawerStatus { initial, loading, loaded, success, error }

class JobDetailsDrawerState {
  final JobDetailsDrawerStatus status;
  final int currentStep;
  final JobDetailsFilter filter;
  final List<JobFilterStep> steps;
  final String? errorMessage;

  const JobDetailsDrawerState({
    this.status = JobDetailsDrawerStatus.initial,
    this.currentStep = 0,
    this.filter = const JobDetailsFilter(),
    this.steps = const [],
    this.errorMessage,
  });

  bool get canGoNext => currentStep < steps.length - 1;
  bool get canGoPrevious => currentStep > 0;

  String? getCurrentSelection() {
    if (steps.isEmpty || currentStep >= steps.length) return null;
    
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

  JobDetailsDrawerState copyWith({
    JobDetailsDrawerStatus? status,
    int? currentStep,
    JobDetailsFilter? filter,
    List<JobFilterStep>? steps,
    String? errorMessage,
  }) {
    return JobDetailsDrawerState(
      status: status ?? this.status,
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      steps: steps ?? this.steps,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}