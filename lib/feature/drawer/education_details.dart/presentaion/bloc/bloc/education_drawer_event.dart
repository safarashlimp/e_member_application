abstract class EducationDrawerEvent {}

class EducationDrawerStepChanged extends EducationDrawerEvent {
  final int step;
  EducationDrawerStepChanged(this.step);
}

class EducationDrawerOptionSelected extends EducationDrawerEvent {
  final String filterKey;
  final String option;
  EducationDrawerOptionSelected(this.filterKey, this.option);
}

class EducationDrawerNextStep extends EducationDrawerEvent {}

class EducationDrawerPreviousStep extends EducationDrawerEvent {}

class EducationDrawerReset extends EducationDrawerEvent {}

class EducationDrawerSubmit extends EducationDrawerEvent {}
