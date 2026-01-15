// house_details_event.dart
abstract class HouseDetailsEvent {}

class SubmitHouseDetails extends HouseDetailsEvent {

  final int? editId;
  final int householdId;
  final int houseTypeId;
  final int? landTypeId;
  final String landAreaCents;
  final int hasToilet;
  final int hasElectricity;
  final String drinkingWaterSourceId;
  final int receivedHousingBenefit;
  final String? receivedBenefits;
  final int needHousingBenefit;
  final String? benefitsRequired;
  final String? wardNeeds;
  final String surveyor;

  SubmitHouseDetails({
    
    this.editId,
    required this.householdId,
    required this.houseTypeId,
    this.landTypeId,
    required this.landAreaCents,
    required this.hasToilet,
    required this.hasElectricity,
    required this.drinkingWaterSourceId,
    required this.receivedHousingBenefit,
    this.receivedBenefits,
    required this.needHousingBenefit,
    this.benefitsRequired,
    this.wardNeeds,
    required this.surveyor,
  });
}
