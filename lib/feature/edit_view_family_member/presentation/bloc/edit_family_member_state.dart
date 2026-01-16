abstract class EditFamilyMemberState {}

class EditFamilyMemberInitial extends EditFamilyMemberState {}

class EditFamilyMemberSubmitting extends EditFamilyMemberState {
  final String screenName;

  EditFamilyMemberSubmitting(this.screenName);
}

class EditFamilyMemberSubmitSuccess extends EditFamilyMemberState {
  final String screenName;
  final String responseId;

  EditFamilyMemberSubmitSuccess({
    required this.screenName,
    required this.responseId,
  });
}

class EditFamilyMemberSubmitFailure extends EditFamilyMemberState {
  final String screenName;
  final String message;

  EditFamilyMemberSubmitFailure({
    required this.screenName,
    required this.message,
  });
}
