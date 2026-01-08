

import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';

abstract class PensionTypeState {}

class PensionTypeInitial extends PensionTypeState {}

class PensionTypeLoading extends PensionTypeState {}

class PensionTypeLoaded extends PensionTypeState {
  final List<MemberDropItem> items;
  PensionTypeLoaded(this.items);
}

class PensionTypeError extends PensionTypeState {
  final String message;
  PensionTypeError(this.message);
}
