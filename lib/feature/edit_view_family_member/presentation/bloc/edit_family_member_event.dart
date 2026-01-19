import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';

abstract class EditFamilyMemberEvent {}

// Screen 1 - Family Member Personal Details
class SubmitPersonalDetailsEvent extends EditFamilyMemberEvent {
  // final String clientId;
  final String editId;
  final PersonalDetailsModel data;
  SubmitPersonalDetailsEvent({
  //  required this.clientId,
    required this.editId,
    required this.data,
  });
}

// Screen 2 - Education Details
class SubmitEducationDetailsEvent extends EditFamilyMemberEvent {


  // final String clientId;
    final String editId;
  final EducationModel data;
  SubmitEducationDetailsEvent({
    required this.data,
    // required this.clientId,
    required this.editId,
  });
}

// Screen 3 - Employment Details
class SubmitEmploymentDetailsEvent extends EditFamilyMemberEvent {
  final EmploymentModel data;
 
  // final String clientId;
  final String editId;
  SubmitEmploymentDetailsEvent({
    required this.data,
    // required this.clientId,
   required this.editId,
  });
}

// Screen 4 - Health Details
class SubmitHealthDetailsEvent extends EditFamilyMemberEvent {
  final HealthModel data;
 
  // final String clientId;
    final String editId;

  SubmitHealthDetailsEvent({
    required this.data,
    // required this.clientId,
  required  this.editId,
  });
}

// Screen 5 - Pension/Welfare Details
class SubmitPensionDetailsEvent extends EditFamilyMemberEvent {
  final WelfareModel data;

  // final String clientId;
  final String editId;
  SubmitPensionDetailsEvent({
    required this.data,
    // required this.clientId,
   required this.editId,
  });
}
