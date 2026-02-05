import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';
import 'package:e_member_app/feature/list_family/domain/repository/list_damily_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FamilyMemberListRepositoryImpl implements FamilyMemberListRepo {
  final http.Client client;

  FamilyMemberListRepositoryImpl(this.client);

  @override
  Future<List<FamilyMember>> getFamilyMemberList(
    String clientId,
    String userId,
    String position,
  ) async {
    final url =
        'https://emember.org/API/detail_list.php?clientid=$clientId&userid=$userId&position=$position';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data =
          FamilyMemberListResponse.fromJson(json.decode(response.body));

      return data.data;
    } else {
      throw Exception('Failed to load family members');
    }
  }
}
