import 'dart:convert';

import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:http/http.dart' as http;


class FamilyMemberRepository {
  Future<void> submitFamilyMember({
    required String clientId,
    int? editId,
    required PersonalDetailsModel data,
  }) async {
    final response = await http.post(
      Uri.parse('https://emember.org/API/family_members_3.php'),
      body: {
        'clientid': clientId,
        if (editId != null) 'editid': editId.toString(),
        'name': data.name,
        'mobile': data.mobile,
        'WhatsApp': data.whatsapp,
        'bloodgroup': data.bloodgroup,
        'relation_id': data.relationId.toString(),
        'gender_id': data.genderId.toString(),
        'dob': data.dob, // yyyy-MM-dd
        'marital_status_id': data.maritalStatusId.toString(),
        'religion_id': data.religionId.toString(),
        'caste_id': data.casteId.toString(),
        'surveyor': data.surveyor,
      },
    );

    final decoded = jsonDecode(response.body);

    // Convert "true"/"false"/bool safely
    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(decoded['data'] ?? 'Family member submission failed');
    }

    // Optional success log
    print('Family member submitted successfully: ${decoded['data']}');
  }
}
