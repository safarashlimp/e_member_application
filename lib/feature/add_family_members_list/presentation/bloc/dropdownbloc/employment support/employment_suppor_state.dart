import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

abstract class EmploymentSupportState {}

class EmploymentSupportInitial extends EmploymentSupportState {}

class EmploymentSupportLoading extends EmploymentSupportState {}

class EmploymentSupportLoaded extends EmploymentSupportState {
  final List<MemberDropItem> items;
  EmploymentSupportLoaded(this.items);
}

class EmploymentSupportError extends EmploymentSupportState {
  final String message;
  EmploymentSupportError(this.message);
}
