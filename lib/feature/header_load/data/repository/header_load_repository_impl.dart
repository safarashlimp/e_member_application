import 'dart:convert';
import 'package:http/http.dart' as http;
import 'header_load_repository.dart';

class HeaderLoadRepositoryImpl implements HeaderLoadRepository {
  final http.Client client;
  HeaderLoadRepositoryImpl(this.client);

  @override
  Future<Map<String, dynamic>> fetchHeader({
    required String clientId,
    required String position,
    required String editId,
  }) async {
    final url =
        'https://emember.org/API/header_load.php?clientid=$clientId&position=$position&editid=$editId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Header load failed');
    }
  }
}
