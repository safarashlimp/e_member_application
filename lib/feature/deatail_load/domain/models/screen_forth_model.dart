import 'dart:convert';

HealthResponse screen3ModelFromJson(String str) =>
    HealthResponse.fromJson(json.decode(str));

String screen3ModelToJson(HealthResponse data) => json.encode(data.toJson());

class HealthResponse {
  final bool status;
  final List<HealthModel> data;

  HealthResponse({required this.status, required this.data});

  factory HealthResponse.fromJson(Map<String, dynamic> json) {
    return HealthResponse(
      status: json['Status'],
      data: List<HealthModel>.from(
          json["data"].map((x) => HealthModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HealthModel {
  final String? id;
  final String? memberId;
  final String isPatient;
  final String diseases;
  final String treatmentPlace;
  final String disabled;
  final String disabilityBenefit;
  final String insuranceCard;
  final String insuranceTypeId;
  final String healthHelp;
  final String surveyor;
  final String? wardMember;

  HealthModel({
    this.id,
    this.memberId,
    required this.isPatient,
    required this.diseases,
    required this.treatmentPlace,
    required this.disabled,
    required this.disabilityBenefit,
    required this.insuranceCard,
    required this.insuranceTypeId,
    required this.healthHelp,
    required this.surveyor,
    this.wardMember,
  });

  factory HealthModel.fromJson(Map<String, dynamic> json) {
    return HealthModel(
      id: json['id'],
      memberId: json['member_id'],
      isPatient: json['is_patient'],
      diseases: json['diseases'],
      treatmentPlace: json['treatment_place'],
      disabled: json['disabled'],
      disabilityBenefit: json['disability_benefit'],
      insuranceCard: json['insurance_card'],
      insuranceTypeId: json['insurance_type_id'],
      healthHelp: json['health_help'],
      surveyor: json['surveyor'],
      wardMember: json['ward_member'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'member_id': memberId,
      'is_patient': isPatient,
      'diseases': diseases,
      'treatment_place': treatmentPlace,
      'disabled': disabled,
      'disability_benefit': disabilityBenefit,
      'insurance_card': insuranceCard,
      'insurance_type_id': insuranceTypeId,
      'health_help': healthHelp,
      'surveyor': surveyor,
      'ward_member': wardMember,
    };
  }
}
