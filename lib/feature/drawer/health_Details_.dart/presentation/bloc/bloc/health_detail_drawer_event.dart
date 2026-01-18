abstract class HealthDrawerEvent {}

class HealthDrawerStepChanged extends HealthDrawerEvent {
  final int step;
  HealthDrawerStepChanged(this.step);
}

class HealthDrawerOptionSelected extends HealthDrawerEvent {
  final String filterKey;
  final String option;
  HealthDrawerOptionSelected(this.filterKey, this.option);
}

class HealthDrawerNextStep extends HealthDrawerEvent {}

class HealthDrawerPreviousStep extends HealthDrawerEvent {}

class HealthDrawerReset extends HealthDrawerEvent {}

class HealthDrawerSubmit extends HealthDrawerEvent {}