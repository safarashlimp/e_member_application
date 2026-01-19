// abstract class AddFilterSubmitEvent {}

// class ChangeStepEvent extends AddFilterSubmitEvent {
//   final int stepIndex;
//   ChangeStepEvent(this.stepIndex);
// }

// class SelectOptionEvent extends AddFilterSubmitEvent {
//   final String stepName;
//   final String option;
//   SelectOptionEvent(this.stepName, this.option);
// }

// class NextStepEvent extends AddFilterSubmitEvent {}

// class PreviousStepEvent extends AddFilterSubmitEvent {}

// class ClearAllSelectionsEvent extends AddFilterSubmitEvent {}

// class SubmitAddFilterSubmitEvent extends AddFilterSubmitEvent {}
// lib/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_event.dart
abstract class FilterEventAddBasic {}

class LoadFilterDataEvent extends FilterEventAddBasic {}

class ChangeStepEvent extends FilterEventAddBasic {
  final int stepIndex;
  ChangeStepEvent(this.stepIndex);
}

class SelectOptionEvent extends FilterEventAddBasic {
  final String stepName;
  final String option;
  SelectOptionEvent(this.stepName, this.option);
}

class ClearAllSelectionsEvent extends FilterEventAddBasic {}

class NextStepEvent extends FilterEventAddBasic {}

class SubmitAddFilterSubmitEvent extends FilterEventAddBasic {}