import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';

abstract class FamilyMemberListRepo {
  Future<List<FamilyMember>> getFamilyMemberList(
    String clientId,
   
    String userId,
     String position,
  );
}
