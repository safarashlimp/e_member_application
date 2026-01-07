


import 'dart:convert';


import 'package:e_member_app/feature/add_servy_report/data/model/ration_card_model.dart';
import 'package:http/http.dart' as http;

class RationCardRepository {
  final String baseUrl =
      "https://emember.org/API/family_drops.php?clientid=1&posistion=1";


  Future<List<RationCard>> fetchRationCards() async {
    final response = await http.get(Uri.parse(baseUrl));
          print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['Status'] == 'true') {
        final List<dynamic> data = jsonData['data'];
        return data.map((e) => RationCard.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load ration cards');
      }
    } else {
      throw Exception('Failed to connect to server');
    }
  }
}
