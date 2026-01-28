import 'dart:convert';
import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HealthDetailsRepository {
  Future<void> submitHealthDetails({
    required String editId,
    required HealthModel data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString(PrefKeys.clientId);

    if (clientId == null || clientId.isEmpty) {
      throw Exception('Client ID not found in preferences');
    }

    final body = {
      'clientid': clientId,
      'editid': editId,
      'is_patient': data.isPatient.toString(),
      'diseases': data.diseases.toString(),
      'treatment_place': data.treatmentPlace.toString(),
      'disabled': data.disabled.toString(),
      'disability_benefit': data.disabilityBenefit.toString(),
      'insurance_card': data.insuranceCard.toString(),
      'insurance_type_id': data.insuranceTypeId.toString(),
      'health_help': data.healthHelp.toString(),
      'surveyor': data.surveyor.toString(),
    };

    final response = await http.post(
      Uri.parse('https://emember.org/API/health_details_6.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    final decoded = jsonDecode(response.body);
    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(decoded['data'] ?? 'Health details submission failed');
    }
  }
}
