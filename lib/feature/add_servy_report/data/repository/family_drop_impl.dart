import 'dart:convert';
import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';
import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:http/http.dart' as http;

class FamilyDropRepositoryImpl implements FamilyDropRepository {
  @override
  Future<List<FamilyDropItem>> getHouseTypes() async {
    final response = await http.get(
      Uri.parse(
        "https://emember.org/API/family_drops.php?clientid=1&posistion=2",
      ),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final model = FamilyDropResponse.fromJson(jsonData);
      return model.data;
    } else {
      throw Exception("Failed to load house types");
    }
  }
  
 @override
Future<List<FamilyDropItem>> getLandTypes() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/family_drops.php?clientid=1&posistion=3",
    ),
  );

  final jsonData = json.decode(response.body);
  final model = FamilyDropResponse.fromJson(jsonData);
  return model.data;
}
@override
Future<List<FamilyDropItem>> getWaterFacilities() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/family_drops.php?clientid=1&posistion=4",
    ),
  );

  final jsonData = json.decode(response.body);
  final model = FamilyDropResponse.fromJson(jsonData);
  return model.data;
}

@override
Future<List<FamilyDropItem>> getRequiredBenefits() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/family_drops.php?clientid=1&posistion=5",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = FamilyDropResponse.fromJson(jsonData);
    return model.data;
  } else {
    throw Exception("Failed to load required benefits");
  }
}
@override
Future<List<FamilyDropItem>> getOtherBenefits() async {
  final response = await http.get(
    Uri.parse("https://emember.org/API/family_drops.php?clientid=1&posistion=6"),
  );

  final jsonData = json.decode(response.body);
  final model = FamilyDropResponse.fromJson(jsonData);
  return model.data;
}
}