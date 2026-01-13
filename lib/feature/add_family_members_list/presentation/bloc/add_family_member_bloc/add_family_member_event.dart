import 'package:e_member_app/feature/add_family_members_list/data/view_model/add_family_member_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_family_member_event.freezed.dart';

@freezed
class AddFamilyMemberEvent with _$AddFamilyMemberEvent {
  const factory AddFamilyMemberEvent.addFamilyMember({
    required AddFamilyMemberViewModel params,
  }) = _AddFamilyMember;
}
