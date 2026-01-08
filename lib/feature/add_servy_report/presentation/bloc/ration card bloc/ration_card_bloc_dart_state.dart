import '../../../data/model/family_dropdown_model.dart';

abstract class RationCardState {}

class RationCardInitial extends RationCardState {}

class RationCardLoading extends RationCardState {}

class RationCardLoaded extends RationCardState {
  final List<FamilyDropItem> items;
  RationCardLoaded(this.items);
}

class RationCardError extends RationCardState {
  final String message;
  RationCardError(this.message);
}
