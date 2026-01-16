import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';

abstract class EditFamilyMemberEvent {}

// Screen 1 - Family Member Personal Details
class SubmitPersonalDetailsEvent extends EditFamilyMemberEvent {
  final PersonalDetailsModel data;
  final int? editId;
  final String clientId;

  SubmitPersonalDetailsEvent({
    required this.data,
    required this.clientId,
    this.editId,
  });
}

// Screen 2 - Education Details
class SubmitEducationDetailsEvent extends EditFamilyMemberEvent {
  final EducationModel data;
  final int? editId;
  final String clientId;

  SubmitEducationDetailsEvent({
    required this.data,
    required this.clientId,
    this.editId,
  });
}

// Screen 3 - Employment Details
class SubmitEmploymentDetailsEvent extends EditFamilyMemberEvent {
  final EmploymentModel data;
  final int? editId;
  final String clientId;

  SubmitEmploymentDetailsEvent({
    required this.data,
    required this.clientId,
    this.editId,
  });
}

// Screen 4 - Health Details
class SubmitHealthDetailsEvent extends EditFamilyMemberEvent {
  final HealthModel data;
  final int? editId;
  final String clientId;

  SubmitHealthDetailsEvent({
    required this.data,
    required this.clientId,
    this.editId,
  });
}

// Screen 5 - Pension/Welfare Details
class SubmitPensionDetailsEvent extends EditFamilyMemberEvent {
  final WelfareModel data;
  final int? editId;
  final String clientId;

  SubmitPensionDetailsEvent({
    required this.data,
    required this.clientId,
    this.editId,  
  });
}
