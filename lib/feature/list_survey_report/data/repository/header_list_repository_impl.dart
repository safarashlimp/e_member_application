import 'dart:convert';

import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';
import 'package:e_member_app/feature/list_survey_report/domain/repository/header_list_repo.dart';
import 'package:http/http.dart' as http;

class HeaderListRepositoryImpl implements HeaderListRepo {
  final http.Client client;

  HeaderListRepositoryImpl(this.client);

  @override
  Future<List<HeaderItem>> getHeaderList(
    String clientId,
    String userId,
    String position,
  ) async {
    final url =
        'https://emember.org/API/header_list.php?clientid=$clientId&userid=$userId&position=$position';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = HeaderListResponse.fromJson(json.decode(response.body));
      return data.data;
    } else {
      throw Exception('Failed to load header list');
    }
  }
}
