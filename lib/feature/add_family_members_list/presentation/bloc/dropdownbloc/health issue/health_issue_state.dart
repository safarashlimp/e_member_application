

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

abstract class HealthIssueState {}

class HealthIssueInitial extends HealthIssueState {}

class HealthIssueLoading extends HealthIssueState {}

class HealthIssueLoaded extends HealthIssueState {
  final List<MemberDropItem> items;
  HealthIssueLoaded(this.items);
}

class HealthIssueError extends HealthIssueState {
  final String message;
  HealthIssueError(this.message);
}
