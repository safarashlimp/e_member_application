import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class WardGeneralNeedState {}

class WardGeneralNeedInitial extends WardGeneralNeedState {}

class WardGeneralNeedLoading extends WardGeneralNeedState {}

class WardGeneralNeedLoaded extends WardGeneralNeedState {
  final List<FamilyDropItem> items;
  WardGeneralNeedLoaded(this.items);
}

class WardGeneralNeedError extends WardGeneralNeedState {
  final String message;
  WardGeneralNeedError(this.message);
}
