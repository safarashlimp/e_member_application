import 'dart:convert';

import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';
import 'package:http/http.dart' as http;

class HouseholdRepository {
  Future<void> submitHousehold({
    required int clientId,
    int? editId,
    required SurveyHeaderModel data,
    required int surveyorId,
  }) async {

    final response = await http.post(
      Uri.parse('https://emember.org/API/households_1.php'),
      body: {
        'clientid': clientId.toString(),
        if (editId != null) 'editid': editId.toString(),
        'house_chief': data.houseChief,
        'house_number': data.houseNumber,
        'house_name': data.houseName,
        'ration_card_number': data.rationCardNumber,
        'ration_card_type_id': data.rationCardTypeId.toString(),
        'annual_income': data.annualIncome,
        'has_job_card': data.hasJobCard.toString(),
        'kudumbashree_member': data.kudumbashreeMember.toString(),
        'govt_beneficiary': data.govtBeneficiary.toString(),
        'extreme_poor': data.extremePoor.toString(),
        'surveyor': surveyorId.toString(),
      },
    );

    final decoded = jsonDecode(response.body);

    if (decoded['Status'] != true) {
      throw Exception(
        decoded['data']?[0]?['error'] ?? 'Submission failed',
      );
    }
  }
}
