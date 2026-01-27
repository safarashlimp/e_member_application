import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

abstract class BloodGroupState {}

class BloodGroupInitial extends BloodGroupState {}

class BloodGroupLoading extends BloodGroupState {}

class BloodGroupLoaded extends BloodGroupState {
  final List<MemberDropItem> items;
  BloodGroupLoaded(this.items);
}

class BloodGroupError extends BloodGroupState {
  final String message;
  BloodGroupError(this.message);
}
