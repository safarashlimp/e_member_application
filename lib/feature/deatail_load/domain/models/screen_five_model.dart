import 'dart:convert';

WelfareResponse screen2ModelFromJson(String str) =>
    WelfareResponse.fromJson(json.decode(str));

String screen2ModelToJson(WelfareResponse data) => json.encode(data.toJson());

class WelfareResponse {
  final bool status;
  final List<WelfareModel> data;

  WelfareResponse({required this.status, required this.data});

  factory WelfareResponse.fromJson(Map<String, dynamic> json) {
    return WelfareResponse(
      status: json['Status'],
      data: List<WelfareModel>.from(
          json["data"].map((x) => WelfareModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WelfareModel {
  final String? id;
  final String? memberId;
  final String includedInRation;
  final String receivingPension;
  final String pensionTypeId;
  final String needPensionTypeId;
  final String povertyPgm;
  final String surveyor;
  final String? wardMember;

  WelfareModel({
    this.id,
    this.memberId,
    required this.includedInRation,
    required this.receivingPension,
    required this.pensionTypeId,
    required this.needPensionTypeId,
    required this.povertyPgm,
    required this.surveyor,
    this.wardMember,
  });

  factory WelfareModel.fromJson(Map<String, dynamic> json) {
    return WelfareModel(
      id: json['id'],
      includedInRation: json['included_in_ration'],
      receivingPension: json['receiving_pension'],
      pensionTypeId: json['pension_type_id'],
      needPensionTypeId: json['need_pension_type_id'],
      povertyPgm: json['poverty_pgm'],
      surveyor: json['surveyor'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'member_id': memberId,
      'included_in_ration': includedInRation,
      'receiving_pension': receivingPension,
      'pension_type_id': pensionTypeId,
      'need_pension_type_id': needPensionTypeId,
      'poverty_pgm': povertyPgm,
      'surveyor': surveyor,
    };
  }
}
