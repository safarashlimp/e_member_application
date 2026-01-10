import 'package:e_member_app/feature/add_family_members_list/data/model/add_family_member_model/add_family_member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'add_family_member_entity.freezed.dart';

@freezed
class AddFamilyMemberEntity with _$AddFamilyMemberEntity {
  const factory AddFamilyMemberEntity({
    required bool status,
    required AddFamilyMemberDataEntity data,
  }) = _AddFamilyMemberEntity;

  /// 🔁 Model → Entity
  factory AddFamilyMemberEntity.fromModel(AddFamilyMemberModel model) {
    return AddFamilyMemberEntity(
      status: model.status,
      data: AddFamilyMemberDataEntity.fromModel(model.data),
    );
  }
}
@freezed
class AddFamilyMemberDataEntity with _$AddFamilyMemberDataEntity {
  const factory AddFamilyMemberDataEntity({
    required int detailId,
  }) = _AddFamilyMemberDataEntity;

  /// 🔁 Model → Entity
  factory AddFamilyMemberDataEntity.fromModel(Data model) {
    return AddFamilyMemberDataEntity(
      detailId: model.detailId,
    );
  }
}

