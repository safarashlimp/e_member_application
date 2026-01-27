// lib/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_event.dart

abstract class JobDetailsDrawerEvent {}

class JobDetailsDrawerInitialize extends JobDetailsDrawerEvent {}

class JobDetailsDrawerStepChanged extends JobDetailsDrawerEvent {
  final int step;
  JobDetailsDrawerStepChanged(this.step);
}

class JobDetailsDrawerOptionSelected extends JobDetailsDrawerEvent {
  final int stepIndex;
  final String optionId; // This will be the actual ID from API
  
  JobDetailsDrawerOptionSelected(this.stepIndex, this.optionId);
}

class JobDetailsDrawerNextStep extends JobDetailsDrawerEvent {}

class JobDetailsDrawerPreviousStep extends JobDetailsDrawerEvent {}

class JobDetailsDrawerReset extends JobDetailsDrawerEvent {}

class JobDetailsDrawerSubmit extends JobDetailsDrawerEvent {}