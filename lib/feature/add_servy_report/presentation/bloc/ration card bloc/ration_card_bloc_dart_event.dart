import 'package:equatable/equatable.dart';



abstract class RationCardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class FetchRationCards extends RationCardEvent {}


class SelectRationCard extends RationCardEvent {
  final int selectedId;

   SelectRationCard(this.selectedId);

  @override
  List<Object?> get props => [selectedId];
}

class SubmitSurvey extends RationCardEvent {
  final String guardianName;
  final String houseName;
  final String houseNumber;
  final String annualIncome;
  final String cardNumber;
  final int rationCardType;

  SubmitSurvey({
    required this.guardianName,
    required this.houseName,
    required this.houseNumber,
    required this.annualIncome,
    required this.cardNumber,
    required this.rationCardType,
  });

  @override
  List<Object?> get props => [
        guardianName,
        houseName,
        houseNumber,
        annualIncome,
        cardNumber,
        rationCardType,
      ];
}
