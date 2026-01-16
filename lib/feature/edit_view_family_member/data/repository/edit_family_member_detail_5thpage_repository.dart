  import 'dart:convert';

import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
import 'package:http/http.dart' as http;


class PensionDetailsRepository {
  Future<void> submitPensionDetails({
    required String clientId,
    int? editId,
    required WelfareModel data,
  }) async {
    final response = await http.post(
      Uri.parse('https://emember.org/API/pension_details_7.php'),
      body: {
        'clientid': clientId,
        if (editId != null) 'editid': editId.toString(),
        'included_in_ration': data.includedInRation,
        'receiving_pension': data.receivingPension,
        'pension_type_id': data.pensionTypeId,
        'need_pension_type_id': data.needPensionTypeId,
        'poverty_pgm': data.povertyPgm,
        'surveyor': data.surveyor,
      },
    );

    final decoded = jsonDecode(response.body);

    final status = decoded['Status'].toString().toLowerCase() == 'true';

    if (!status) {
      throw Exception(
        decoded['data'] ?? 'Pension details submission failed',
      );
    }

    // Optional success log
    print('Pension details submitted successfully: ${decoded['data']}');
  }
} 
