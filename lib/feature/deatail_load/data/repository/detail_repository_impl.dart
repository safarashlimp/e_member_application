import 'dart:convert';
import 'package:e_member_app/feature/deatail_load/data/repository/detail_repository.dart';
import 'package:http/http.dart' as http;


class FamilyMemberDetailsLoadRepositoryImpl implements FamilyMemberDetailsLoadRepository  {
  final http.Client client;
  FamilyMemberDetailsLoadRepositoryImpl(this.client);

  @override
  Future<Map<String, dynamic>> fetchDetails({
    required String clientId,
    required String position,
    required String editId,
  }) async {
    final url =
        'https://emember.org/API/detail_load.php?clientid=$clientId&position=$position&editid=$editId';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Header load failed');
    }
  }
}
