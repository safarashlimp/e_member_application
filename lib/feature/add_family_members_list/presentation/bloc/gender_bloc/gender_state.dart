import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';

abstract class GenderState {}

class GenderInitial extends GenderState {}

class GenderLoading extends GenderState {}

class GenderLoaded extends GenderState {
  final List<MemberDropItem> items;
  GenderLoaded(this.items);
}

class GenderError extends GenderState {
  final String message;
  GenderError(this.message);
}
