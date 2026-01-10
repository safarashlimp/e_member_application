abstract class HeaderLoadState {}

class HeaderLoadInitial extends HeaderLoadState {}

class HeaderLoadLoading extends HeaderLoadState {}

class HeaderLoadLoaded extends HeaderLoadState {
  final Map<String, dynamic> data;
  HeaderLoadLoaded(this.data);
}

class HeaderLoadError extends HeaderLoadState {
  final String message;
  HeaderLoadError(this.message);
}
