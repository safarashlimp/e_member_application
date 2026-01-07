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
