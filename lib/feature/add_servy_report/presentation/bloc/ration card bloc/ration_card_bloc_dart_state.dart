import 'package:e_member_app/feature/add_servy_report/data/model/ration_card_model.dart';
import 'package:equatable/equatable.dart';

abstract class RationCardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RationCardInitial extends RationCardState {}

class RationCardLoading extends RationCardState {}

class RationCardLoaded extends RationCardState {
  final List<RationCard> rationCards;

  RationCardLoaded({required this.rationCards});

  @override
  List<Object?> get props => [rationCards];
}

class RationCardError extends RationCardState {
  final String message;

  RationCardError({required this.message});

  @override
  List<Object?> get props => [message];
}
