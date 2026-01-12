import 'dart:convert';
import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HeaderSaveRepository {
  Future<int> saveSurveyHeader({
    
    //required String clientId, 
    String? houseChief,
    required String houseNumber,
    required String houseName,
    required String rationCardNumber,
    required String rationCardTypeId,
    String? annualIncome,

    // RADIO VALUES (0 / 1)
    required int hasJobCard,
    required int kudumbashreeMember,
    required int govtBeneficiary,
    required int extremePoor,

    required String houseTypeId,
    int? landTypeId,
    String? landAreaCents,
    int? hasToilet,
    int? hasElectricity,
    String? drinkingWaterSourceId,
    int? receivedHousingBenefit,
    String? receivedBenefits,
    int? needHousingBenefit,
    String? benefitsRequired,
    String? wardNeeds,
    String?surveyor,
  }) async {
final prefs = await SharedPreferences.getInstance();
final clientId = prefs.getString(PrefKeys.clientId);
final userId   = prefs.getString(PrefKeys.userId);

    // DEBUG
    print('CLIENTID FROM PREF: $clientId' );
    print('USERID FROM PREF: $userId');

    if (clientId == null || clientId.isEmpty) {
      throw Exception('Client ID not found. Please login again.');
    // final prefs = await SharedPreferences.getInstance();
    // final clientId = prefs.getString('clientid');
    // final userid = prefs.getString('userid');

    // if (clientId == null || clientId.isEmpty) {
    //   throw Exception('Client ID not found. Please login again.');
    }

    final uri = Uri.parse("https://emember.org/API/header_save.php");

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'clientid': clientId,
          'userid': userId,
        'house_chief': houseChief ?? '',
        'house_number': houseNumber,
        'house_name': houseName,
        'ration_card_number': rationCardNumber,
        'ration_card_type_id': rationCardTypeId,
        'annual_income': annualIncome ?? '',

        // RADIO (0 / 1)
        'has_job_card': (hasJobCard).toString(),
        'kudumbashree_member': (kudumbashreeMember).toString(),
        'govt_beneficiary': (govtBeneficiary).toString(),
        'extreme_poor': (extremePoor).toString(),
             'surveyor': surveyor ?? '',
        // 'surveyor': surveyorId ?? '',
        'house_type_id': houseTypeId,
        'land_type_id': (landTypeId ?? 0).toString(),
        'land_area_cents':
            (landAreaCents != null && landAreaCents.isNotEmpty)
                ? landAreaCents
                : '0',

        'has_toilet': (hasToilet ?? 0).toString(),
        'has_electricity': (hasElectricity ?? 0).toString(),
        'drinking_water_source_id': drinkingWaterSourceId ?? '',

        'received_housing_benefit':
            (receivedHousingBenefit ?? 0).toString(),
        'received_benefits':
            (receivedBenefits != null && receivedBenefits.isNotEmpty)
                ? receivedBenefits
                : '0',

        'need_housing_benefit':
            (needHousingBenefit ?? 0).toString(),
        'benefits_required':
            (benefitsRequired != null && benefitsRequired.isNotEmpty)
                ? benefitsRequired
                : '0',

        'ward_needs': wardNeeds ?? '',
      },
    );

    print('STATUS CODE: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Header save failed');
    }

    final decoded = json.decode(response.body);

    // ✅ CORRECT KEY + BOOL CHECK
    if (decoded['Status'] != true && decoded['Status'] != "true") {
      throw Exception(decoded['message'] ?? 'Failed to save data');
    }

    // ✅ RETURN header_id (VERY IMPORTANT FOR NEXT SCREENS)
    return decoded['data']['header_id'] as int;
  }
}
