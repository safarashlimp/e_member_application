// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'add_family_member_model.freezed.dart';

// part 'add_family_member_model.g.dart';
// @freezed
// class AddFamilyMemberModel with _$AddFamilyMemberModel {
//     const factory AddFamilyMemberModel({
//         @JsonKey(name: "Status")
//         required bool status,
//         @JsonKey(name: "data")
//         required Data data,
//     }) = _AddFamilyMemberModel;
//     factory AddFamilyMemberModel.fromJson(Map<String, dynamic> json) =>
//       _$AddFamilyMemberModelFromJson(json);

// }

// @freezed
// class Data with _$Data {
//     const factory Data({
//         @JsonKey(name: "detail_id")
//         required int detailId,
//     }) = _Data;
//       factory Data.fromJson(Map<String, dynamic> json) =>
//       _$DataFromJson(json);

// }
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_family_member_model.freezed.dart';
part 'add_family_member_model.g.dart';

@freezed
class AddFamilyMemberModel with _$AddFamilyMemberModel {
  const factory AddFamilyMemberModel({
    @JsonKey(name: "Status") required bool status,
    @JsonKey(name: "data") Data? data, // nullable
  }) = _AddFamilyMemberModel;

  factory AddFamilyMemberModel.fromJson(Map<String, dynamic> json) =>
      _$AddFamilyMemberModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "detail_id") required int detailId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
