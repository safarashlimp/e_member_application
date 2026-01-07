

import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';

abstract class FarmingTypeState {}

class FarmingTypeInitial extends FarmingTypeState {}

class FarmingTypeLoading extends FarmingTypeState {}

class FarmingTypeLoaded extends FarmingTypeState {
  final List<MemberDropItem> items;
  FarmingTypeLoaded(this.items);
}

class FarmingTypeError extends FarmingTypeState {
  final String message;
  FarmingTypeError(this.message);
}
