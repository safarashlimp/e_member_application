
import 'dart:convert';
EducationResponse screen2ModelFromJson(String str) => EducationResponse.fromJson(json.decode(str));

String screen2ModelToJson(EducationResponse data) => json.encode(data.toJson());
class EducationResponse {
  final bool status;
  final List<EducationModel> data;

  EducationResponse({required this.status, required this.data});

  factory EducationResponse.fromJson(Map<String, dynamic> json) {
    return EducationResponse(
      status: json['Status'],
      data: List<EducationModel>.from(json["data"].map((x) => EducationModel.fromJson(x))),
    );
    
  }
  Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

  class EducationModel {
    final String ?id;
    final String ?memberId;
    final String qualificationId;
    final String currentlyStudying;
    final String courseId;
    final String courseOther;
    final String institution;
    final String needEducationSupport;
    final String surveyor;
    final String ?wardMember;

      EducationModel({
      this.id,
       this.memberId,
      required this.qualificationId,
      required this.currentlyStudying,
      required this.courseId,
      required this.courseOther,
      required this.institution,
      required this.needEducationSupport,
      required this.surveyor,
       this.wardMember,
    });

    factory EducationModel.fromJson(Map<String, dynamic> json) {
      return EducationModel(
        id: json['id'],
        memberId: json['member_id'],
        qualificationId: json['qualification_id'],
        currentlyStudying: json['currently_studying'],
        courseId: json['course_id'],
        courseOther: json['course_other'],
        institution: json['institution'],
        needEducationSupport: json['need_education_support'],
        surveyor: json['surveyor'],
        wardMember: json['ward_member'],
      );
      
  }
  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'member_id': memberId,
    'qualification_id': qualificationId,
    'currently_studying': currentlyStudying,
    'course_id': courseId,
    'course_other': courseOther,
    'institution': institution,
    'need_education_support': needEducationSupport,
    'surveyor': surveyor,
    'ward_member': wardMember,
  };
}
}
