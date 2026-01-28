import 'dart:convert';

import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EmploymentDetailsRepository {
  Future<void> submitEmploymentDetails({
    required String editId,
    required EmploymentModel data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString(PrefKeys.clientId);

    if (clientId == null) {
      throw Exception('Client ID not found in preferences');
    }

    final body = {
      'clientid': clientId,
      'editid': editId,
      'employment_status_id': data.employmentStatusId,
      'occupation_id': data.occupationId,
      'skills': data.skills,
      'skill_details': data.skillDetails,
      'need_job_support_id': data.needJobSupportId,
      'norka_registered': data.norkaRegistered,
      'agriculure_type': data.agricultureType,
      'surveyor': data.surveyor,
    };

    final response = await http.post(
      Uri.parse('https://emember.org/API/employment_details_5.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    final decoded = jsonDecode(response.body);
    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(
        decoded['data'] ?? 'Employment details submission failed',
      );
    }
  }
}
