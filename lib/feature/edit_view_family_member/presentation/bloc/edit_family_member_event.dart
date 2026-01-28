import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';

abstract class EditFamilyMemberEvent {}

class SubmitPersonalDetailsEvent extends EditFamilyMemberEvent {
  final String editId;
  final PersonalDetailsModel data;
  SubmitPersonalDetailsEvent({
    required this.editId,
    required this.data,
  });
}

class SubmitEducationDetailsEvent extends EditFamilyMemberEvent {
  final String editId;
  final EducationModel data;
  SubmitEducationDetailsEvent({
    required this.data,
    required this.editId,
  });
}

class SubmitEmploymentDetailsEvent extends EditFamilyMemberEvent {
  final EmploymentModel data;

  final String editId;
  SubmitEmploymentDetailsEvent({
    required this.data,
    required this.editId,
  });
}

class SubmitHealthDetailsEvent extends EditFamilyMemberEvent {
  final HealthModel data;

  final String editId;

  SubmitHealthDetailsEvent({
    required this.data,
    required this.editId,
  });
}

// Screen 5 - Pension/Welfare Details
class SubmitPensionDetailsEvent extends EditFamilyMemberEvent {
  final WelfareModel data;

  final String editId;
  SubmitPensionDetailsEvent({
    required this.data,
    required this.editId,
  });
}
