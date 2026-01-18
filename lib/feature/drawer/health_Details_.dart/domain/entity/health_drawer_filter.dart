class HealthDrawerFilter {
  final String? isPatient;
  final String? hasDisability;
  final String? receivesGovernmentBenefits;
  final String? hasHealthInsurance;
  final String? requiredHealthAssistance;

  const HealthDrawerFilter({
    this.isPatient,
    this.hasDisability,
    this.receivesGovernmentBenefits,
    this.hasHealthInsurance,
    this.requiredHealthAssistance,
  });

  HealthDrawerFilter copyWith({
    String? isPatient,
    String? hasDisability,
    String? receivesGovernmentBenefits,
    String? hasHealthInsurance,
    String? requiredHealthAssistance,
  }) {
    return HealthDrawerFilter(
      isPatient: isPatient ?? this.isPatient,
      hasDisability: hasDisability ?? this.hasDisability,
      receivesGovernmentBenefits: receivesGovernmentBenefits ?? this.receivesGovernmentBenefits,
      hasHealthInsurance: hasHealthInsurance ?? this.hasHealthInsurance,
      requiredHealthAssistance: requiredHealthAssistance ?? this.requiredHealthAssistance,
    );
  }

  bool get isComplete {
    return isPatient != null &&
        hasDisability != null &&
        receivesGovernmentBenefits != null &&
        hasHealthInsurance != null &&
        requiredHealthAssistance != null;
  }

  Map<String, String?> toMap() {
    return {
      'isPatient': isPatient,
      'hasDisability': hasDisability,
      'receivesGovernmentBenefits': receivesGovernmentBenefits,
      'hasHealthInsurance': hasHealthInsurance,
      'requiredHealthAssistance': requiredHealthAssistance,
    };
  }
}