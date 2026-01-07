import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class WaterFacilityState {}

class WaterFacilityInitial extends WaterFacilityState {}

class WaterFacilityLoading extends WaterFacilityState {}

class WaterFacilityLoaded extends WaterFacilityState {
  final List<FamilyDropItem> items;
  WaterFacilityLoaded(this.items);
}

class WaterFacilityError extends WaterFacilityState {
  final String message;
  WaterFacilityError(this.message);
}
