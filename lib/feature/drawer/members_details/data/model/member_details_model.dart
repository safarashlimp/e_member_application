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
      bloodGroup: entity.bloodGroup,
      gender: entity.gender,
      maritalStatus: entity.maritalStatus,
      religion: entity.religion,
      caste: entity.caste,
    );
  }

  MemberDetailsFilter toEntity() {
    return MemberDetailsFilter(
      bloodGroup: bloodGroup,
      gender: gender,
      maritalStatus: maritalStatus,
      religion: religion,
      caste: caste,
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