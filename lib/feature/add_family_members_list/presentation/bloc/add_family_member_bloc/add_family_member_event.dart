import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_family_member_event.freezed.dart';

@freezed
class AddFamilyMemberEvent with _$AddFamilyMemberEvent {
  const factory AddFamilyMemberEvent.addFamilyMember({
    required Map<String, dynamic> params,
  }) = _AddFamilyMember;
}
