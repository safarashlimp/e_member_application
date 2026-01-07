


import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';
import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class MemberDropRepository {
  Future<List<MemberDropItem>> getRelations(); 
   Future<List<FamilyDropItem>> getMaritalStatus();
}
