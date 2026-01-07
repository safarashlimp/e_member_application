


import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';


abstract class MemberDropRepository {
  Future<List<MemberDropItem>> getRelations(); 
   Future<List<MemberDropItem>> getMaritalStatus();
    Future<List<MemberDropItem>> getCastes();
      Future<List<MemberDropItem>> getQualifications();
      Future<List<MemberDropItem>>getEducationList();
}
