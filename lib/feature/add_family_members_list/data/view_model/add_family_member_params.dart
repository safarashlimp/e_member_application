import 'dart:convert';
import 'package:flutter/foundation.dart';

class AddFamilyMemberViewModel extends ChangeNotifier {
  // 🔹 IDs
  int clientId = 0;
  int editId = 0;        // household_id
  int userId = 0;        // ward_member

  // 🔹 Basic info
  String name = '';
  String mobile = '';
  String whatsapp = '';

  // 🔹 Personal details
  int bloodGroupId = 0;
  int relationId = 0;
  int genderId = 0;
  String dob = ''; // yyyy-MM-dd
  int maritalStatusId = 0;
  int religionId = 0;
  int casteId = 0;

  // 🔹 Education
  int surveyorId = 0;
  int qualificationId = 0;
  bool currentlyStudying = false;
  int courseId = 0;
  String courseOther = '';
  String institution = '';
  bool needEducationSupport = false;

  // 🔹 Employment
  int employmentStatusId = 0;
  int occupationId = 0;
  List<int> skillIds = []; // 👈 multi select
  String skillDetails = '';
  int needJobSupportId = 0;
  bool norkaRegistered = false;
  int agricultureTypeId = 0;

  // 🔹 Health
  bool isPatient = false;
  String diseases = '';
  String treatmentPlace = '';

  bool disabled = false;
  bool disabilityBenefit = false;

  bool insuranceCard = false;
  int insuranceTypeId = 0;
  bool healthHelp = false;

  // 🔹 Welfare
  bool includedInRation = false;
  bool receivingPension = false;
  int pensionTypeId = 0;
  int needPensionTypeId = 0;

  int povertyProgramId = 0;

  /// 🔥 BUILD API PARAMS
  Map<String, dynamic> addFamilyMemberViewModel() {
    return {
      "clientid": clientId,
      "household_id": editId,
      "ward_member": userId,

      "name": name,
      "mobile": mobile,
      "WhatsApp": whatsapp,

      "bloodgroup": bloodGroupId,
      "relation_id": relationId,
      "gender_id": genderId,
      "dob": dob,
      "marital_status_id": maritalStatusId,
      "religion_id": religionId,
      "caste_id": casteId,

      "surveyor": surveyorId,
      "qualification_id": qualificationId,
      "currently_studying": currentlyStudying ? 1 : 0,

      "course_id": courseId,
      "course_other": courseOther,
      "institution": institution,
      "need_education_support": needEducationSupport ? 1 : 0,

      "employment_status_id": employmentStatusId,
      "occupation_id": occupationId,

      // 👇 JSON ARRAY
      "skills": jsonEncode(skillIds),
      "skill_details": skillDetails,

      "need_job_support_id": needJobSupportId,
      "norka_registered": norkaRegistered ? 1 : 0,
      "agriculure_type": agricultureTypeId,

      "is_patient": isPatient ? 1 : 0,
      "diseases": diseases,
      "treatment_place": treatmentPlace,

      "disabled": disabled ? 1 : 0,
      "disability_benefit": disabilityBenefit ? 1 : 0,

      "insurance_card": insuranceCard ? 1 : 0,
      "insurance_type_id": insuranceTypeId,
      "health_help": healthHelp ? 1 : 0,

      "included_in_ration": includedInRation ? 1 : 0,
      "receiving_pension": receivingPension ? 1 : 0,
      "pension_type_id": pensionTypeId,
      "need_pension_type_id": needPensionTypeId,

      "poverty_pgm": povertyProgramId,
    };
  }
}
