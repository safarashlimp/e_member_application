
import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';

abstract class FamilyMemberRemoteDatasource {
  Future<FamilyMemberListResponse> getFamilyMemberList({
    required String clientId,
    required String userId,
    required String position,
  });
}
