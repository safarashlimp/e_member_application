


import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';

abstract class FamilyMemberListState {}

class FamilyMemberListInitial extends FamilyMemberListState {}

class FamilyMemberListLoading extends FamilyMemberListState {}

class  FamilyMemberListLoaded extends FamilyMemberListState {
  final List<FamilyMember> members;

  FamilyMemberListLoaded(this.members);
}

class FamilyMemberListError extends FamilyMemberListState {
  final String message;

  FamilyMemberListError(this.message);
}
