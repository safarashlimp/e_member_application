import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';

abstract class EditFamilyMemberState {}

class EditFamilyMemberInitial extends EditFamilyMemberState {}

class   EditFamilyMemberSubmitting extends EditFamilyMemberState {
  final String screenName;

  EditFamilyMemberSubmitting(this.screenName);
}

class EditFamilyMemberSubmitSuccess extends EditFamilyMemberState {
  final String screenName;
  final String responseId;
  final PersonalDetailsModel? updatedData; // ✅ Add this

  EditFamilyMemberSubmitSuccess({
    required this.screenName,
    required this.responseId,
    this.updatedData, // ✅ Optional updated data
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
