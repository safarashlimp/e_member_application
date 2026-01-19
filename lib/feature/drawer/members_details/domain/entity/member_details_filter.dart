// lib/feature/drawer/members_details/domain/entity/member_details_filter.dart
class MemberDetailsFilter {
  final String? bloodGroupId;
  final String? genderId;
  final String? maritalStatusId;
  final String? religionId;
  final String? casteId;

  const MemberDetailsFilter({
    this.bloodGroupId,
    this.genderId,
    this.maritalStatusId,
    this.religionId,
    this.casteId,
  });

  MemberDetailsFilter copyWith({
    String? bloodGroupId,
    String? genderId,
    String? maritalStatusId,
    String? religionId,
    String? casteId,
  }) {
    return MemberDetailsFilter(
      bloodGroupId: bloodGroupId ?? this.bloodGroupId,
      genderId: genderId ?? this.genderId,
      maritalStatusId: maritalStatusId ?? this.maritalStatusId,
      religionId: religionId ?? this.religionId,
      casteId: casteId ?? this.casteId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'blood_group_id': bloodGroupId,
      'gender_id': genderId,
      'marital_status_id': maritalStatusId,
      'religion_id': religionId,
      'caste_id': casteId,
    };
  }

  @override
  String toString() {
    return 'MemberDetailsFilter(bloodGroupId: $bloodGroupId, genderId: $genderId, maritalStatusId: $maritalStatusId, religionId: $religionId, casteId: $casteId)';
  }
}