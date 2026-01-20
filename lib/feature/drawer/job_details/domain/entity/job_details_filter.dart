// lib/feature/drawer/job_details/domain/entity/job_details_filter.dart

class JobDetailsFilter {
  final String? employmentStatus; // Will store employment status ID
  final String? occupation; // Will store job/occupation ID
  final String? needEmploymentHelp; // Will store employment support ID

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

  Map<String, dynamic> toMap() {
    return {
      if (employmentStatus != null) 'employment_status_id': employmentStatus,
      if (occupation != null) 'occupation_id': occupation,
      if (needEmploymentHelp != null) 'employment_support_id': needEmploymentHelp,
    };
  }
}