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
    String position, {
    Map<String, dynamic>? filters,
  }) async {
    // Build base URL
    var url = 'https://emember.org/API/header_list.php?clientid=$clientId&userid=$userId&position=$position';
    
    // Add filter parameters if provided
    if (filters != null && filters.isNotEmpty) {
      filters.forEach((key, value) {
        if (value != null) {
          url += '&$key=$value';
        }
      });
    }

    print('🔍 Fetching header list with URL: $url');
    
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = HeaderListResponse.fromJson(json.decode(response.body));
      print('✅ Received ${data.data.length} items');
      return data.data;
    } else {
      throw Exception('Failed to load header list');
    }
  }
}