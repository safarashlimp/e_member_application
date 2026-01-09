

import 'package:e_member_app/feature/alldropdownlist/data/model/family_member_model.dart';

abstract class EmploymentStatusState {}

class EmploymentStatusInitial extends EmploymentStatusState {}

class EmploymentStatusLoading extends EmploymentStatusState {}

class EmploymentStatusLoaded extends EmploymentStatusState {
  final List<MemberDropItem> items;
  EmploymentStatusLoaded(this.items);
}

class EmploymentStatusError extends EmploymentStatusState {
  final String message;
  EmploymentStatusError(this.message);
}
