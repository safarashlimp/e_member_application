abstract class MemberDetailsEvent {}

class MemberDetailsStepChanged extends MemberDetailsEvent {
  final int step;
  MemberDetailsStepChanged(this.step);
}

class MemberDetailsOptionSelected extends MemberDetailsEvent {
  final String filterKey;
  final String option;
  MemberDetailsOptionSelected(this.filterKey, this.option);
}

class MemberDetailsNextStep extends MemberDetailsEvent {}

class MemberDetailsPreviousStep extends MemberDetailsEvent {}

class MemberDetailsReset extends MemberDetailsEvent {}

class MemberDetailsSubmit extends MemberDetailsEvent {}