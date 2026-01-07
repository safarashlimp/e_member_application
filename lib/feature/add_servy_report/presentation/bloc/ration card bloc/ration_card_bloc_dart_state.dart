import 'package:equatable/equatable.dart';
import 'package:e_member_app/feature/add_servy_report/data/model/ration_card_model.dart';

abstract class RationCardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RationCardInitial extends RationCardState {}

class RationCardLoading extends RationCardState {}

class RationCardLoaded extends RationCardState {
  final List<RationCard> rationCards;
  final int? selectedCardId;

   RationCardLoaded({
    required this.rationCards,
    this.selectedCardId,
  });

  RationCardLoaded copyWith({int? selectedCardId}) {
    return RationCardLoaded(
      rationCards: rationCards,
      selectedCardId: selectedCardId ?? this.selectedCardId,
    );
  }

  @override
  List<Object?> get props => [rationCards, selectedCardId];
}

class RationCardError extends RationCardState {
  final String message;

   RationCardError(this.message);

  @override
  List<Object?> get props => [message];
}
