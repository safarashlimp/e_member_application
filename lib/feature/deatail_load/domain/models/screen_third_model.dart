import 'dart:convert';

EmploymentResponse screen3ModelFromJson(String str) =>
    EmploymentResponse.fromJson(json.decode(str));

String screen3ModelToJson(EmploymentResponse data) =>
    json.encode(data.toJson());

class EmploymentResponse {
  final bool status;
  final List<EmploymentModel> data;

  EmploymentResponse({required this.status, required this.data});

  factory EmploymentResponse.fromJson(Map<String, dynamic> json) {
    return EmploymentResponse(
      status: json['Status'],
      data: List<EmploymentModel>.from(
          json["data"].map((x) => EmploymentModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EmploymentModel {
  final String? id;
  final String? memberId;
  final String employmentStatusId;
  final String occupationId;
  final String skills;
  final String skillDetails;
  final String needJobSupportId;
  final String norkaRegistered;
  final String agricultureType;
  final String surveyor;
  final String? wardMember;

  EmploymentModel({
    this.id,
    this.memberId,
    required this.employmentStatusId,
    required this.occupationId,
    required this.skills,
    required this.skillDetails,
    required this.needJobSupportId,
    required this.norkaRegistered,
    required this.agricultureType,
    required this.surveyor,
    this.wardMember,
  });
  factory EmploymentModel.fromJson(Map<String, dynamic> json) {
    String skillsValue = '[]';

    if (json['skills'] != null) {
      if (json['skills'] is List) {
        skillsValue = jsonEncode(json['skills']);
      } else {
        skillsValue = json['skills'].toString();

        if (!skillsValue.trim().startsWith('[')) {
          final ids = skillsValue
              .split(',')
              .where((e) => e.trim().isNotEmpty)
              .map((e) => e.trim())
              .toList();
          skillsValue = jsonEncode(ids);
        }
      }
    }

    return EmploymentModel(
      id: json['id'],
      memberId: json['member_id'],
      employmentStatusId: json['employment_status_id'],
      occupationId: json['occupation_id'],
      skills: skillsValue,
      skillDetails: json['skill_details'],
      needJobSupportId: json['need_job_support_id'],
      norkaRegistered: json['norka_registered'],
      agricultureType: json['agriculure_type'],
      surveyor: json['surveyor'],
      wardMember: json['ward_member'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'member_id': memberId,
      'employment_status_id': employmentStatusId,
      'occupation_id': occupationId,
      'skills': skills,
      'skill_details': skillDetails,
      'need_job_support_id': needJobSupportId,
      'norka_registered': norkaRegistered,
      'agriculure_type': agricultureType,
      'surveyor': surveyor,
      'ward_member': wardMember,
    };
  }
}
