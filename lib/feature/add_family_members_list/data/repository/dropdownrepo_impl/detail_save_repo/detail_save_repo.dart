import 'dart:convert';
import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FamilyMemberSaveRepository {
  Future<int> saveFamilyMember({
    required String householdId, // editId
    required String name,

    String? mobile,
    String? whatsapp,

    required int bloodGroupId,
    required int relationId,
    required int genderId,
    required String dob,
    required int maritalStatusId,
    required int religionId,
    required int casteId,

    required String surveyor,

    required int qualificationId,
    required int currentlyStudying,
    int? courseId,
    String? courseOther,
    String? institution,
    int? needEducationSupport,

    required int employmentStatusId,
    int? occupationId,
    String? skills,
    String? skillDetails,
    int? needJobSupportId,

    int? norkaRegistered,
    int? agricultureType,
    int? isPatient,

    // 🔹 HEALTH
    String? diseases,
    String? treatmentPlace,
    int? disabled,
    int? disabilityBenefit,
    int? insuranceCard,
    int? insuranceTypeId,
    int? healthHelp,

    // 🔹 SOCIAL SECURITY
    int? includedInRation,
    int? receivingPension,
    int? pensionTypeId,
    int? needPensionTypeId,
    int? povertyPgm,
  }) async {
   
    

    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString(PrefKeys.clientId);
    final userId = prefs.getString(PrefKeys.userId);

    if (clientId == null || clientId.isEmpty) {
      throw Exception('Client ID missing');
    }

    if (userId == null || userId.isEmpty) {
      throw Exception('User ID missing');
    }

    final response = await http.post(
      Uri.parse('https://emember.org/API/detail_save.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'clientid': clientId,
        'household_id': householdId,
        'ward_member': userId,

        'name': name,
        'mobile': mobile ,
        'whatsapp': whatsapp ,

        'bloodgroup': bloodGroupId.toString(),
        'relation_id': relationId.toString(),
        'gender_id': genderId.toString(),
        'dob': dob,
        'marital_status_id': maritalStatusId.toString(),
        'religion_id': religionId.toString(),
        'caste_id': casteId.toString(),

        'surveyor': surveyor,

        'qualification_id': qualificationId.toString(),
       'currently_studying': (currentlyStudying ?? 0).toString(),
        'course_id': (courseId ?? 0).toString(),
        'course_other': courseOther ?? '',
        'institution': institution ?? '',
        'need_education_support':
            (needEducationSupport ?? 0).toString(),

        'employment_status_id': employmentStatusId.toString(),
        'occupation_id': (occupationId ?? 0).toString(),
        'skills': skills ?? '',
        'skill_details': skillDetails ?? '',
        'need_job_support_id':
            (needJobSupportId ?? 0).toString(),

        'norka_registered': (norkaRegistered ?? 0).toString(),
        'agriculure_type': (agricultureType ?? 0).toString(),
        'is_patient': (isPatient ?? 0).toString(),

        // 🔹 HEALTH
       'diseases': (diseases ?? 0).toString(),
        'treatment_place': treatmentPlace ?? '',
        'disabled': (disabled ?? 0).toString(),
        'disability_benefit':
            (disabilityBenefit ?? 0).toString(),
        'insurance_card': (insuranceCard ?? 0).toString(),
        'insurance_type_id':
            (insuranceTypeId ?? 0).toString(),
        'health_help': (healthHelp ?? 0).toString(),

        // 🔹 SOCIAL SECURITY
        'included_in_ration':
            (includedInRation ?? 0).toString(),
        'receiving_pension':
            (receivingPension ?? 0).toString(),
        'pension_type_id':
            (pensionTypeId ?? 0).toString(),
        'need_pension_type_id':
            (needPensionTypeId ?? 0).toString(),
        'poverty_pgm': (povertyPgm ?? 0).toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Server error');
    }

    final decoded = json.decode(response.body);

    if (decoded['Status'] != true && decoded['Status'] != "true") {
      throw Exception(decoded['message'] ?? 'Failed to save family member');
    }

    /// backend usually returns member_id
    return decoded['data']['member_id'] ?? 1;
  }
}
