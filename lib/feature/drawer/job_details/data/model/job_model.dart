
import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';

class JobDetailsModel {
  final String? employmentStatus;
  final String? occupation;
  final String? needEmploymentHelp;

  const JobDetailsModel({
    this.employmentStatus,
    this.occupation,
    this.needEmploymentHelp,
  });

  factory JobDetailsModel.fromEntity(JobDetailsFilter entity) {
    return JobDetailsModel(
      employmentStatus: entity.employmentStatus,
      occupation: entity.occupation,
      needEmploymentHelp: entity.needEmploymentHelp,
    );
  }

  JobDetailsFilter toEntity() {
    return JobDetailsFilter(
      employmentStatus: employmentStatus,
      occupation: occupation,
      needEmploymentHelp: needEmploymentHelp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employmentStatus': employmentStatus,
      'occupation': occupation,
      'needEmploymentHelp': needEmploymentHelp,
    };
  }

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) {
    return JobDetailsModel(
      employmentStatus: json['employmentStatus'],
      occupation: json['occupation'],
      needEmploymentHelp: json['needEmploymentHelp'],
    );
  }
}