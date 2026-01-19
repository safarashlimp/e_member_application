// lib/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_event.dart
abstract class EducationDrawerEvent {
  const EducationDrawerEvent();
}

class LoadEducationFilterData extends EducationDrawerEvent {
  const LoadEducationFilterData();
}

class EducationDrawerStepChanged extends EducationDrawerEvent {
  final int step;
  const EducationDrawerStepChanged(this.step);
}

class EducationDrawerOptionSelected extends EducationDrawerEvent {
  final String filterKey;
  final String optionId; // Changed to store ID
  const EducationDrawerOptionSelected(this.filterKey, this.optionId);
}

class EducationDrawerNextStep extends EducationDrawerEvent {
  const EducationDrawerNextStep();
}

class EducationDrawerPreviousStep extends EducationDrawerEvent {
  const EducationDrawerPreviousStep();
}

class EducationDrawerReset extends EducationDrawerEvent {
  const EducationDrawerReset();
}

class EducationDrawerSubmit extends EducationDrawerEvent {
  const EducationDrawerSubmit();
}