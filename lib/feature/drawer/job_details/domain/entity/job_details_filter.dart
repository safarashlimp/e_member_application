class JobDetailsFilter {
  final String? employmentStatus;
  final String? occupation;
  final String? needEmploymentHelp;

  const JobDetailsFilter({
    this.employmentStatus,
    this.occupation,
    this.needEmploymentHelp,
  });

  JobDetailsFilter copyWith({
    String? employmentStatus,
    String? occupation,
    String? needEmploymentHelp,
  }) {
    return JobDetailsFilter(
      employmentStatus: employmentStatus ?? this.employmentStatus,
      occupation: occupation ?? this.occupation,
      needEmploymentHelp: needEmploymentHelp ?? this.needEmploymentHelp,
    );
  }

  bool get isComplete {
    return employmentStatus != null &&
        occupation != null &&
        needEmploymentHelp != null;
  }

  Map<String, String?> toMap() {
    return {
      'employmentStatus': employmentStatus,
      'occupation': occupation,
      'needEmploymentHelp': needEmploymentHelp,
    };
  }
}