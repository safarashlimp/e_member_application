


import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';


abstract class MemberDropRepository {
  Future<List<MemberDropItem>> getRelations(); 
   Future<List<MemberDropItem>> getMaritalStatus();
    Future<List<MemberDropItem>> getCastes();
      Future<List<MemberDropItem>> getQualifications();
      Future<List<MemberDropItem>>getEducationList();
        Future<List<MemberDropItem>>getEmploymentStatus();
         Future<List<MemberDropItem>>getJobs();
         Future<List<MemberDropItem>>getEmploymentSupports();
Future<List<MemberDropItem>>getFarmingTypes();
Future<List<MemberDropItem>>getHealthIssues();
Future<List <MemberDropItem>>getHealthInsurance();
Future<List <MemberDropItem>>getRequiredHealthSupports();
}
