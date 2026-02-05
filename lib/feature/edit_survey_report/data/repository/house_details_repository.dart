import 'dart:convert';
import 'package:http/http.dart' as http;

class HouseDetailsRepository {
  Future<void> submitHouseDetails({
    required int clientId,
    int? editId,
    required int householdId,
    required int houseTypeId,
    int? landTypeId,
    required String landAreaCents,
    required int hasToilet,
    required int hasElectricity,
    required String drinkingWaterSourceId,
    required int receivedHousingBenefit,
    String? receivedBenefits,
    required int needHousingBenefit,
    String? benefitsRequired,
    String? wardNeeds,
    required String surveyor,
  }) async {
    final response = await http.post(
      Uri.parse('https://emember.org/API/house_details_2.php'),
      body: {
        'clientid': clientId.toString(),
        if (editId != null) 'editid': editId.toString(),
        'household_id': householdId.toString(),
        'house_type_id': houseTypeId.toString(),
        if (landTypeId != null) 'land_type_id': landTypeId.toString(),
        'land_area_cents': landAreaCents,
        'has_toilet': hasToilet.toString(),
        'has_electricity': hasElectricity.toString(),
        'drinking_water_source_id': drinkingWaterSourceId,
        'received_housing_benefit': receivedHousingBenefit.toString(),
        'received_benefits': receivedBenefits ?? '0',
        'need_housing_benefit': needHousingBenefit.toString(),
        'benefits_required': benefitsRequired ?? '0',
        'ward_needs': wardNeeds ?? '',
        'surveyor': surveyor,

        // 'member_id': ,
      },
    );

    try {
      final decoded = jsonDecode(response.body);

      // Convert Status to bool safely
      final status = decoded['Status'].toString().toLowerCase() == 'true';

      if (!status) {
        // Handle error message
        if (decoded['data'] is List && decoded['data'].isNotEmpty) {
          final error = decoded['data'][0]['error'] ?? 'Failed';
          throw Exception(error);
        } else if (decoded['data'] is String) {
          throw Exception(decoded['data']);
        } else {
          throw Exception('Failed');
        }
      }
    } catch (e) {
      throw Exception(
          'Server returned invalid response. Please check backend. Response: ${response.body}');
    }
  }
}
