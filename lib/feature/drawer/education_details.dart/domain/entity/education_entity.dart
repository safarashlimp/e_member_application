// lib/feature/drawer/education_details.dart/domain/entity/education_entity.dart
class EducationFilter {
  final String? educationalQualificationId;
  final String? currentlyStudyingId; // 1 for Yes, 0 for No

  const EducationFilter({
    this.educationalQualificationId,
    this.currentlyStudyingId,
  });

  EducationFilter copyWith({
    String? educationalQualificationId,
    String? currentlyStudyingId,
  }) {
    return EducationFilter(
      educationalQualificationId: educationalQualificationId ?? this.educationalQualificationId,
      currentlyStudyingId: currentlyStudyingId ?? this.currentlyStudyingId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'educational_qualification_id': educationalQualificationId,
      'currently_studying': currentlyStudyingId, // Will be "1" or "0"
    };
  }

  @override
  String toString() {
    return 'EducationFilter(educationalQualificationId: $educationalQualificationId, currentlyStudyingId: $currentlyStudyingId)';
  }
}