abstract class AddFilterSubmitEvent {}

class ChangeStepEvent extends AddFilterSubmitEvent {
  final int stepIndex;
  ChangeStepEvent(this.stepIndex);
}

class SelectOptionEvent extends AddFilterSubmitEvent {
  final String stepName;
  final String option;
  SelectOptionEvent(this.stepName, this.option);
}

class NextStepEvent extends AddFilterSubmitEvent {}

class PreviousStepEvent extends AddFilterSubmitEvent {}

class ClearAllSelectionsEvent extends AddFilterSubmitEvent {}

class SubmitAddFilterSubmitEvent extends AddFilterSubmitEvent {}