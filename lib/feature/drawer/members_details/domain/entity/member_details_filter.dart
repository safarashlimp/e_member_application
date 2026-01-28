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
  final Map<String, dynamic> data = {};

  if (bloodGroupId != null) {
    data['blood_group_id'] = bloodGroupId;
  }
  if (genderId != null) {
    data['gender_id'] = genderId;
  }
  if (maritalStatusId != null) {
    data['marital_status_id'] = maritalStatusId;
  }
  if (religionId != null) {
    data['religion_id'] = religionId;
  }
  if (casteId != null) {
    data['caste_id'] = casteId;
  }

  return data;
}


  @override
  String toString() {
    return 'MemberDetailsFilter(bloodGroupId: $bloodGroupId, genderId: $genderId, maritalStatusId: $maritalStatusId, religionId: $religionId, casteId: $casteId)';
  }
}