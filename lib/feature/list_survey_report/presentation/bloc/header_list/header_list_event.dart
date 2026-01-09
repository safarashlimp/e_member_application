abstract class HeaderListEvent {}

class FetchHeaderList extends HeaderListEvent {
  final String position; 

  FetchHeaderList(this.position);
}
