// To parse this JSON data, do
//
//     final screen2Model = screen2ModelFromJson(jsonString);

import 'dart:convert';

Screen2Model screen2ModelFromJson(String str) => Screen2Model.fromJson(json.decode(str));

String screen2ModelToJson(Screen2Model data) => json.encode(data.toJson());

class Screen2Model {
    bool status;
    List<Datum> data;

    Screen2Model({
        required this.status,
        required this.data,
    });

    factory Screen2Model.fromJson(Map<String, dynamic> json) => Screen2Model(
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
    String householdId;
    String houseTypeId;
    String landTypeId;
    String landAreaCents;
    String hasToilet;
    String hasElectricity;
    String drinkingWaterSourceId;
    String receivedHousingBenefit;
    String receivedBenefits;
    String needHousingBenefit;
    String benefitsRequired;
    String wardNeeds;
    String surveyor;
    String wardMember;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.householdId,
        required this.houseTypeId,
        required this.landTypeId,
        required this.landAreaCents,
        required this.hasToilet,
        required this.hasElectricity,
        required this.drinkingWaterSourceId,
        required this.receivedHousingBenefit,
        required this.receivedBenefits,
        required this.needHousingBenefit,
        required this.benefitsRequired,
        required this.wardNeeds,
        required this.surveyor,
        required this.wardMember,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        householdId: json["household_id"],
        houseTypeId: json["house_type_id"],
        landTypeId: json["land_type_id"],
        landAreaCents: json["land_area_cents"],
        hasToilet: json["has_toilet"],
        hasElectricity: json["has_electricity"],
        drinkingWaterSourceId: json["drinking_water_source_id"],
        receivedHousingBenefit: json["received_housing_benefit"],
        receivedBenefits: json["received_benefits"],
        needHousingBenefit: json["need_housing_benefit"],
        benefitsRequired: json["benefits_required"],
        wardNeeds: json["ward_needs"],
        surveyor: json["surveyor"],
        wardMember: json["ward_member"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "household_id": householdId,
        "house_type_id": houseTypeId,
        "land_type_id": landTypeId,
        "land_area_cents": landAreaCents,
        "has_toilet": hasToilet,
        "has_electricity": hasElectricity,
        "drinking_water_source_id": drinkingWaterSourceId,
        "received_housing_benefit": receivedHousingBenefit,
        "received_benefits": receivedBenefits,
        "need_housing_benefit": needHousingBenefit,
        "benefits_required": benefitsRequired,
        "ward_needs": wardNeeds,
        "surveyor": surveyor,
        "ward_member": wardMember,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
