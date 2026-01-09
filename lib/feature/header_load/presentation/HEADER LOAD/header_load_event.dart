abstract class HeaderLoadEvent {}

class FetchHeaderLoad extends HeaderLoadEvent {
  final String editId;
  final String position;

  FetchHeaderLoad({
    required this.editId,
    required this.position,
  });
}
