class SurveyHeaderModel {
  final String houseChief;
  final String houseNumber;
  final String houseName;
  final String rationCardNumber;
  final String rationCardTypeId;
  final String ? annualIncome;
  final int hasJobCard;
  final int kudumbashreeMember;
  final int govtBeneficiary;
  final int extremePoor;
  final String? surveyor;

  SurveyHeaderModel({
    required this.houseChief,
    required this.houseNumber,
    required this.houseName,
    required this.rationCardNumber,
    required this.rationCardTypeId,
     this.annualIncome,
    required this.hasJobCard,
    required this.kudumbashreeMember,
    required this.govtBeneficiary,
    required this.extremePoor,
    this.surveyor
  });
}
