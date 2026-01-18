class MemberDetailsFilter {
  final String? bloodGroup;
  final String? gender;
  final String? maritalStatus;
  final String? religion;
  final String? caste;

  const MemberDetailsFilter({
    this.bloodGroup,
    this.gender,
    this.maritalStatus,
    this.religion,
    this.caste,
  });

  MemberDetailsFilter copyWith({
    String? bloodGroup,
    String? gender,
    String? maritalStatus,
    String? religion,
    String? caste,
  }) {
    return MemberDetailsFilter(
      bloodGroup: bloodGroup ?? this.bloodGroup,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      religion: religion ?? this.religion,
      caste: caste ?? this.caste,
    );
  }

  bool get isComplete {
    return bloodGroup != null &&
        gender != null &&
        maritalStatus != null &&
        religion != null &&
        caste != null;
  }

  Map<String, String?> toMap() {
    return {
      'bloodGroup': bloodGroup,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'religion': religion,
      'caste': caste,
    };
  }
}