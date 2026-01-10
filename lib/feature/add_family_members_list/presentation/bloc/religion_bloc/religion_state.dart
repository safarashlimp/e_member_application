
import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';

abstract class ReligionState {}

class ReligionInitial extends ReligionState {}

class ReligionLoading extends ReligionState {}

class ReligionLoaded extends ReligionState {
  final List<MemberDropItem> items;
ReligionLoaded(this.items);
}

class ReligionError extends ReligionState {
  final String message;
  ReligionError(this.message);
}
