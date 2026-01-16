import 'dart:convert';

import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:http/http.dart' as http;


class HealthDetailsRepository {
  Future<void> submitHealthDetails({
    required String clientId,
    int? editId,
    required HealthModel data,
  }) async {
    final response = await http.post(
      Uri.parse('https://emember.org/API/health_details_6.php'),
      body: {
        'clientid': clientId,
        if (editId != null) 'editid': editId.toString(),
        'is_patient': data.isPatient,
        'diseases': data.diseases,
        'treatment_place': data.treatmentPlace,
        'disabled': data.disabled,
        'disability_benefit': data.disabilityBenefit,
        'insurance_card': data.insuranceCard,
        'insurance_type_id': data.insuranceTypeId,
        'health_help': data.healthHelp,
        'surveyor': data.surveyor,
      },
    );

    final decoded = jsonDecode(response.body);

    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(
        decoded['data'] ?? 'Health details submission failed',
      );
    }

    // Optional success log
    print('Health details submitted successfully: ${decoded['data']}');
  }
}
