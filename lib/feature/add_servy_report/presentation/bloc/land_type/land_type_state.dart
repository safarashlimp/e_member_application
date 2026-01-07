import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class LandTypeState {}

class LandTypeInitial extends LandTypeState {}

class LandTypeLoading extends LandTypeState {}

class LandTypeLoaded extends LandTypeState {
  final List<FamilyDropItem> items;
  LandTypeLoaded(this.items);
}

class LandTypeError extends LandTypeState {
  final String message;
  LandTypeError(this.message);
}
