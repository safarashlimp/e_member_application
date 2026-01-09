abstract class HeaderListEvent {}

class FetchHeaderList extends HeaderListEvent {
  final String position; // "1"

  FetchHeaderList(this.position);
}
