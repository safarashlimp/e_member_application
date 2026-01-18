import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_entity.dart';

class EducationModel {
  final String? educationalQualification;
  final String? currentlyStudying;

  const EducationModel({
    this.educationalQualification,
    this.currentlyStudying,
  });

  factory EducationModel.fromEntity(EducationFilter entity) {
    return EducationModel(
      educationalQualification: entity.educationalQualification,
      currentlyStudying: entity.currentlyStudying,
    );
  }

  EducationFilter toEntity() {
    return EducationFilter(
      educationalQualification: educationalQualification,
      currentlyStudying: currentlyStudying,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'educationalQualification': educationalQualification,
      'currentlyStudying': currentlyStudying,
    };
  }

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      educationalQualification: json['educationalQualification'],
      currentlyStudying: json['currentlyStudying'],
    );
  }
}
