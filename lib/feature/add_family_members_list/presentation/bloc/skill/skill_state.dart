

import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';

abstract class SkillsState {}

class SkillsInitial extends SkillsState {}

class SkillsLoading extends SkillsState {}

class SkillsLoaded extends SkillsState {
  final List<MemberDropItem> items;
  SkillsLoaded(this.items);
}

class SkillsError extends SkillsState {
  final String message;
  SkillsError(this.message);
}
