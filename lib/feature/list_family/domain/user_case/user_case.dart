

import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';
import 'package:e_member_app/feature/list_family/domain/repository/list_damily_repository.dart';

class GetFamilyMemberListUsecase {
  final FamilyMemberListRepo repo;

  GetFamilyMemberListUsecase(this.repo);

  Future<List<FamilyMember>> call(
    String clientId,

    String userId,
        String position,
  // editId
  ) {
    return repo.getFamilyMemberList(clientId,userId, position,);
  }
}
