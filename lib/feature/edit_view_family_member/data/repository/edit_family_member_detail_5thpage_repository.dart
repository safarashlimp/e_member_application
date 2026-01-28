import 'dart:convert';
import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PensionDetailsRepository {
  Future<void> submitPensionDetails({
    required String editId,
    required WelfareModel data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString(PrefKeys.clientId);

    if (clientId == null || clientId.isEmpty) {
      throw Exception('Client ID not found in preferences');
    }

    final body = {
      'clientid': clientId,
      'editid': editId,
      'included_in_ration': data.includedInRation.toString(),
      'receiving_pension': data.receivingPension.toString(),
      'pension_type_id': data.pensionTypeId.toString(),
      'need_pension_type_id': data.needPensionTypeId.toString(),
      'poverty_pgm': data.povertyPgm.toString(),
      'surveyor': data.surveyor.toString(),
    };

    final response = await http.post(
      Uri.parse('https://emember.org/API/pension_details_7.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    final decoded = jsonDecode(response.body);
    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(
        decoded['data'] ?? 'Pension details submission failed',
      );
    }
  }
}
