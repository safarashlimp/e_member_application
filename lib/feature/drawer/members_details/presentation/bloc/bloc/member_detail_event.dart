// lib/feature/drawer/members_details/presentation/bloc/bloc/member_detail_event.dart
abstract class MemberDetailsEvent {
  const MemberDetailsEvent();
}

class LoadMemberFilterData extends MemberDetailsEvent {
  const LoadMemberFilterData();
}

class MemberDetailsStepChanged extends MemberDetailsEvent {
  final int step;
  const MemberDetailsStepChanged(this.step);
}

class MemberDetailsOptionSelected extends MemberDetailsEvent {
  final String filterKey;
  final String optionId; // Changed to store ID instead of name
  const MemberDetailsOptionSelected(this.filterKey, this.optionId);
}

class MemberDetailsNextStep extends MemberDetailsEvent {
  const MemberDetailsNextStep();
}

class MemberDetailsPreviousStep extends MemberDetailsEvent {
  const MemberDetailsPreviousStep();
}

class MemberDetailsReset extends MemberDetailsEvent {
  const MemberDetailsReset();
}

class MemberDetailsSubmit extends MemberDetailsEvent {
  const MemberDetailsSubmit();
}