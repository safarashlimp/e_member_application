import 'package:e_member_app/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_family_member_state.freezed.dart';

@freezed
class AddFamilyMemberState with _$AddFamilyMemberState {
  const factory AddFamilyMemberState.initial() = Initial;
  const factory AddFamilyMemberState.loading() = Loading;
  const factory AddFamilyMemberState.error({required Failure failure}) = Error;
  const factory AddFamilyMemberState.loaded(int detailId) = Loaded;
}
