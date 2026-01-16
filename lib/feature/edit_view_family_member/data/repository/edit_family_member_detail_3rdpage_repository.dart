import 'dart:convert';

import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:http/http.dart' as http;


class EmploymentDetailsRepository {
  Future<void> submitEmploymentDetails({
    required String clientId,
    int? editId,
    required EmploymentModel  data,
  }) async {
    final response = await http.post(
      Uri.parse('https://emember.org/API/employment_details_5.php'),
      body: {
        'clientid': clientId,
        if (editId != null) 'editid': editId.toString(),
        'employment_status_id': data.employmentStatusId,
        'occupation_id': data.occupationId,
        'skills': data.skills,
        'skill_details': data.skillDetails,
        'need_job_support_id': data.needJobSupportId,
        'norka_registered': data.norkaRegistered,
        'agriculure_type': data.agricultureType,
        'surveyor': data.surveyor,
      },
    );

    final decoded = jsonDecode(response.body);

    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(
        decoded['data'] ?? 'Employment details submission failed',
      );
    }

    // Optional success log
    print('Employment details submitted successfully: ${decoded['data']}');
  }
}
