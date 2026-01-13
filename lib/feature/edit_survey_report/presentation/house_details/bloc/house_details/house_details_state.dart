// house_details_state.dart
abstract class HouseDetailsState {}

class HouseDetailsInitial extends HouseDetailsState {}

class HouseDetailsLoading extends HouseDetailsState {}

class HouseDetailsSuccess extends HouseDetailsState {}

class HouseDetailsError extends HouseDetailsState {
  final String message;
  HouseDetailsError(this.message);
}
