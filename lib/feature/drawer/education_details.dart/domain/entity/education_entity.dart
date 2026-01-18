
class EducationFilter {
  final String? educationalQualification;
  final String? currentlyStudying;

  const EducationFilter({
    this.educationalQualification,
    this.currentlyStudying,
  });

  EducationFilter copyWith({
    String? educationalQualification,
    String? currentlyStudying,
  }) {
    return EducationFilter(
      educationalQualification: educationalQualification ?? this.educationalQualification,
      currentlyStudying: currentlyStudying ?? this.currentlyStudying,
    );
  }

  bool get isComplete {
    return educationalQualification != null && currentlyStudying != null;
  }

  Map<String, String?> toMap() {
    return {
      'educationalQualification': educationalQualification,
      'currentlyStudying': currentlyStudying,
    };
  }
}