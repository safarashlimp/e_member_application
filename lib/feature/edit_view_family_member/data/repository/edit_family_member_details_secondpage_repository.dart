import 'dart:convert';

import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:http/http.dart' as http;

class EducationDetailsRepository {
  Future<void> submitEducationDetails({
    required String clientId,
    int? editId,
    required EducationModel data,
  }) async {
    final response = await http.post(
      Uri.parse('https://emember.org/API/education_details_4.php'),
      body: {
        'clientid': clientId,
        if (editId != null) 'editid': editId.toString(),
        'qualification_id': data.qualificationId,
        'currently_studying': data.currentlyStudying,
        'course_id': data.courseId,
        'course_other': data.courseOther,
        'institution': data.institution,
        'need_education_support': data.needEducationSupport,
        'surveyor': data.surveyor,
      },
    );

    final decoded = jsonDecode(response.body);

    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(
        decoded['data'] ?? 'Education details submission failed',
      );
    }

    // Optional success log
    print('Education details submitted successfully: ${decoded['data']}');
  }
}
