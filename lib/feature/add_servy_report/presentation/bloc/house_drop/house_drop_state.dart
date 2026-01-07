import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class HouseTypeState {}

class HouseTypeInitial extends HouseTypeState {}

class HouseTypeLoading extends HouseTypeState {}

class HouseTypeLoaded extends HouseTypeState {
  final List<FamilyDropItem> items;

  HouseTypeLoaded(this.items);
}

class HouseTypeError extends HouseTypeState {
  final String message;

  HouseTypeError(this.message);
}
