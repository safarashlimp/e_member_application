// lib/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart

class HealthDrawerFilter {
  final String? isPatient; // Will store "1" or "0"
  final String? hasDisability; // Will store "1" or "0"
  final String? receivesGovernmentBenefits; // Will store "1" or "0"
  final String? hasHealthInsurance; // Will store "1" or "0"
  final String? requiredHealthAssistance; // Will store health support ID

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

  Map<String, dynamic> toMap() {
    return {
      if (isPatient != null) 'is_patient': isPatient,
      if (hasDisability != null) 'has_disability': hasDisability,
      if (receivesGovernmentBenefits != null) 'receives_government_benefits': receivesGovernmentBenefits,
      if (hasHealthInsurance != null) 'has_health_insurance': hasHealthInsurance,
      if (requiredHealthAssistance != null) 'required_health_assistance_id': requiredHealthAssistance,
    };
  }
}