import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';

abstract class EditFamilyMemberEvent {}

// ✅ Initialize form with existing data
class InitializeFormEvent extends EditFamilyMemberEvent {
  final PersonalDetailsModel data;

  InitializeFormEvent(this.data);
}

// ✅ Form field update events
class UpdateNameEvent extends EditFamilyMemberEvent {
  final String name;
  UpdateNameEvent(this.name);
}

class UpdateMobileEvent extends EditFamilyMemberEvent {
  final String mobile;
  UpdateMobileEvent(this.mobile);
}

class UpdateWhatsappEvent extends EditFamilyMemberEvent {
  final String whatsapp;
  UpdateWhatsappEvent(this.whatsapp);
}

class UpdateDobEvent extends EditFamilyMemberEvent {
  final String dob;
  UpdateDobEvent(this.dob);
}

class UpdateSurveyorEvent extends EditFamilyMemberEvent {
  final String surveyor;
  UpdateSurveyorEvent(this.surveyor);
}

class UpdateBloodGroupEvent extends EditFamilyMemberEvent {
  final String? bloodGroupId;
  final String? bloodGroupName;
  UpdateBloodGroupEvent({this.bloodGroupId, this.bloodGroupName});
}

class UpdateRelationEvent extends EditFamilyMemberEvent {
  final String? relationId;
  final String? relationName;
  UpdateRelationEvent({this.relationId, this.relationName});
}

class UpdateGenderEvent extends EditFamilyMemberEvent {
  final String? genderId;
  final String? genderName;
  UpdateGenderEvent({this.genderId, this.genderName});
}

class UpdateMaritalStatusEvent extends EditFamilyMemberEvent {
  final String? statusId;
  final String? statusName;
  UpdateMaritalStatusEvent({this.statusId, this.statusName});
}

class UpdateReligionEvent extends EditFamilyMemberEvent {
  final String? religionId;
  final String? religionName;
  UpdateReligionEvent({this.religionId, this.religionName});
}

class UpdateCasteEvent extends EditFamilyMemberEvent {
  final String? casteId;
  final String? casteName;
  UpdateCasteEvent({this.casteId, this.casteName});
}

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
