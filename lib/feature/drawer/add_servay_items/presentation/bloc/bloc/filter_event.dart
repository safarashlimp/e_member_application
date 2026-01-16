abstract class FilterEvent {}

class LoadFilters extends FilterEvent {}

class ChangeStep extends FilterEvent {
  final int stepIndex;
  ChangeStep(this.stepIndex);
}

class SelectOption extends FilterEvent {
  final String filterKey;
  final String option;
  SelectOption(this.filterKey, this.option);
}

class NextStep extends FilterEvent {}

class PreviousStep extends FilterEvent {}

class ClearAllFilters extends FilterEvent {}

class SubmitFilterEvent extends FilterEvent {}