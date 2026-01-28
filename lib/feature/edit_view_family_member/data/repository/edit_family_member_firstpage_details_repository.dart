import 'dart:convert';

import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FamilyMemberRepository {
  Future<void> submitFamilyMember({
    required String editId,
    required PersonalDetailsModel data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString(PrefKeys.clientId);
    final body = {
      'clientid': clientId,
      'editid': editId,
      'name': data.name,
      'mobile': data.mobile,
      'whatsapp': data.whatsapp,
      'bloodgroup': data.bloodgroup.toString(),
      'relation_id': data.relationId.toString(),
      'gender_id': data.genderId.toString(),
      'dob': data.dob,
      'marital_status_id': data.maritalStatusId.toString(),
      'religion_id': data.religionId.toString(),
      'caste_id': data.casteId.toString(),
      'surveyor': data.surveyor.toString(),
    };
    final response = await http.post(
      Uri.parse('https://emember.org/API/family_members_3.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    final decoded = jsonDecode(response.body);
    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(decoded['data'] ?? 'Family member update failed');
    }
  }
}
