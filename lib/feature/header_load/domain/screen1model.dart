// To parse this JSON data, do
//
//     final screen1Model = screen1ModelFromJson(jsonString);

import 'dart:convert';

Screen1Model screen1ModelFromJson(String str) => Screen1Model.fromJson(json.decode(str));

String screen1ModelToJson(Screen1Model data) => json.encode(data.toJson());

class Screen1Model {
    bool status;
    List<Datum> data;

    Screen1Model({
        required this.status,
        required this.data,
    });

    factory Screen1Model.fromJson(Map<String, dynamic> json) => Screen1Model(
        status: json["Status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String houseChief;
    String houseNumber;
    String houseName;
    String rationCardNumber;
    String rationCardTypeId;
    String annualIncome;
    String hasJobCard;
    String kudumbashreeMember;
    String govtBeneficiary;
    String extremePoor;
    String surveyor;
    String wardMember;
    DateTime createdAt;
    dynamic updatedAt;

    Datum({
        required this.id,
        required this.houseChief,
        required this.houseNumber,
        required this.houseName,
        required this.rationCardNumber,
        required this.rationCardTypeId,
        required this.annualIncome,
        required this.hasJobCard,
        required this.kudumbashreeMember,
        required this.govtBeneficiary,
        required this.extremePoor,
        required this.surveyor,
        required this.wardMember,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        houseChief: json["house_chief"],
        houseNumber: json["house_number"],
        houseName: json["house_name"],
        rationCardNumber: json["ration_card_number"],
        rationCardTypeId: json["ration_card_type_id"],
        annualIncome: json["annual_income"],
        hasJobCard: json["has_job_card"],
        kudumbashreeMember: json["kudumbashree_member"],
        govtBeneficiary: json["govt_beneficiary"],
        extremePoor: json["extreme_poor"],
        surveyor: json["surveyor"],
        wardMember: json["ward_member"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "house_chief": houseChief,
        "house_number": houseNumber,
        "house_name": houseName,
        "ration_card_number": rationCardNumber,
        "ration_card_type_id": rationCardTypeId,
        "annual_income": annualIncome,
        "has_job_card": hasJobCard,
        "kudumbashree_member": kudumbashreeMember,
        "govt_beneficiary": govtBeneficiary,
        "extreme_poor": extremePoor,
        "surveyor": surveyor,
        "ward_member": wardMember,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
    };
}
// To parse this JSON data, do
//
//     final screen1Model = screen1ModelFromJson(jsonString);

