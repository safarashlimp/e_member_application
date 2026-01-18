abstract class JobDetailsDrawerEvent {}

class JobDetailsDrawerStepChanged extends JobDetailsDrawerEvent {
  final int step;
  JobDetailsDrawerStepChanged(this.step);
}

class JobDetailsDrawerOptionSelected extends JobDetailsDrawerEvent {
  final String filterKey;
  final String option;
  JobDetailsDrawerOptionSelected(this.filterKey, this.option);
}

class JobDetailsDrawerNextStep extends JobDetailsDrawerEvent {}

class JobDetailsDrawerPreviousStep extends JobDetailsDrawerEvent {}

class JobDetailsDrawerReset extends JobDetailsDrawerEvent {}

class JobDetailsDrawerSubmit extends JobDetailsDrawerEvent {}
