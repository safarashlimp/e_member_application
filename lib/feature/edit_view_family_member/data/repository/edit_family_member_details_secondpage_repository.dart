import 'dart:convert';

import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EducationDetailsRepository {
  Future<void> submitEducationDetails({
    required String editId,
    required EducationModel data,
  }) async {
    // ✅ Get clientId from SharedPreferences (SINGLE SOURCE)
    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString(PrefKeys.clientId);

    if (clientId == null) {
      throw Exception('Client ID not found in preferences');
    }

    final body = {
      'clientid': clientId, // ✅ same as FamilyMemberRepository
      'editid': editId,
      'qualification_id': data.qualificationId,
      'currently_studying': data.currentlyStudying,
      'course_id': data.courseId,
      'course_other': data.courseOther,
      'institution': data.institution,
      'need_education_support': data.needEducationSupport,
      'surveyor': data.surveyor,
    };

    print('📤 Sending request:');
    print('URL: https://emember.org/API/education_details_4.php');
    print('Body: $body');

    final response = await http.post(
      Uri.parse('https://emember.org/API/education_details_4.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    print('📥 Response status: ${response.statusCode}');
    print('📥 Response body: ${response.body}');

    final decoded = jsonDecode(response.body);
    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(decoded['data'] ?? 'Education details submission failed');
    }

    print('✅ Education details submitted successfully: ${decoded['data']}');
  }
}
