import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';

class HealthDrawerModel {
  final String? isPatient;
  final String? hasDisability;
  final String? receivesGovernmentBenefits;
  final String? hasHealthInsurance;
  final String? requiredHealthAssistance;

  const HealthDrawerModel({
    this.isPatient,
    this.hasDisability,
    this.receivesGovernmentBenefits,
    this.hasHealthInsurance,
    this.requiredHealthAssistance,
  });

  factory HealthDrawerModel.fromEntity(HealthDrawerFilter entity) {
    return HealthDrawerModel(
      isPatient: entity.isPatient,
      hasDisability: entity.hasDisability,
      receivesGovernmentBenefits: entity.receivesGovernmentBenefits,
      hasHealthInsurance: entity.hasHealthInsurance,
      requiredHealthAssistance: entity.requiredHealthAssistance,
    );
  }

  HealthDrawerFilter toEntity() {
    return HealthDrawerFilter(
      isPatient: isPatient,
      hasDisability: hasDisability,
      receivesGovernmentBenefits: receivesGovernmentBenefits,
      hasHealthInsurance: hasHealthInsurance,
      requiredHealthAssistance: requiredHealthAssistance,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isPatient': isPatient,
      'hasDisability': hasDisability,
      'receivesGovernmentBenefits': receivesGovernmentBenefits,
      'hasHealthInsurance': hasHealthInsurance,
      'requiredHealthAssistance': requiredHealthAssistance,
    };
  }

  factory HealthDrawerModel.fromJson(Map<String, dynamic> json) {
    return HealthDrawerModel(
      isPatient: json['isPatient'],
      hasDisability: json['hasDisability'],
      receivesGovernmentBenefits: json['receivesGovernmentBenefits'],
      hasHealthInsurance: json['hasHealthInsurance'],
      requiredHealthAssistance: json['requiredHealthAssistance'],
    );
  }
}