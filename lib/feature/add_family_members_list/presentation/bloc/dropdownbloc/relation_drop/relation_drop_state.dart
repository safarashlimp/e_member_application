

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

abstract class RelationDropState {}

class RelationDropInitial extends RelationDropState {}

class RelationDropLoading extends RelationDropState {}

class RelationDropLoaded extends RelationDropState {
  final List<MemberDropItem> items;
  RelationDropLoaded(this.items);
}

class RelationDropError extends RelationDropState {
  final String message;
  RelationDropError(this.message);
}
