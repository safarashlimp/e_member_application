import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_details_filter.dart';

class MemberDetailsModel {
  final String? bloodGroup;
  final String? gender;
  final String? maritalStatus;
  final String? religion;
  final String? caste;

  const MemberDetailsModel({
    this.bloodGroup,
    this.gender,
    this.maritalStatus,
    this.religion,
    this.caste,
  });

  factory MemberDetailsModel.fromEntity(MemberDetailsFilter entity) {
    return MemberDetailsModel(
      bloodGroup: entity.bloodGroupId,
      gender: entity.genderId,
      maritalStatus: entity.maritalStatusId,
      religion: entity.religionId,
      caste: entity.casteId,
    );
  }

  MemberDetailsFilter toEntity() {
    return MemberDetailsFilter(
      bloodGroupId: bloodGroup,
      genderId: gender,
      maritalStatusId: maritalStatus,
      religionId: religion,
      casteId: caste,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bloodGroup': bloodGroup,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'religion': religion,
      'caste': caste,
    };
  }

  factory MemberDetailsModel.fromJson(Map<String, dynamic> json) {
    return MemberDetailsModel(
      bloodGroup: json['bloodGroup'],
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      religion: json['religion'],
      caste: json['caste'],
    );
  }
}