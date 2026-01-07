import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class FamilyDropRepository {
  Future<List<FamilyDropItem>> getHouseTypes();
  Future<List<FamilyDropItem>> getLandTypes();
  Future<List<FamilyDropItem>> getWaterFacilities();
  Future<List<FamilyDropItem>> getRequiredBenefits(); 
  Future<List<FamilyDropItem>> getOtherBenefits();
}
