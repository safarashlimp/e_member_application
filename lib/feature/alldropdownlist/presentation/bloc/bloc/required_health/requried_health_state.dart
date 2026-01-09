
import 'package:e_member_app/feature/alldropdownlist/data/model/family_member_model.dart';

abstract class RequiredHealthSupportState {}

class RequiredHealthSupportInitial extends RequiredHealthSupportState {}

class RequiredHealthSupportLoading extends RequiredHealthSupportState {}

class RequiredHealthSupportLoaded extends RequiredHealthSupportState {
  final List<MemberDropItem> items;
  RequiredHealthSupportLoaded(this.items);
}

class RequiredHealthSupportError extends RequiredHealthSupportState {
  final String message;
  RequiredHealthSupportError(this.message);
}
