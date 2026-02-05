abstract class HeaderListEvent {}

class FetchHeaderList extends HeaderListEvent {
  final String position;
  final Map<String, dynamic>? filters;

  FetchHeaderList(this.position, {this.filters});
}

class ApplyFilters extends HeaderListEvent {
  final String position;
  final Map<String, dynamic> filters;

  ApplyFilters(this.position, this.filters);
}

class ClearFilters extends HeaderListEvent {
  final String position;

  ClearFilters(this.position);
}

class LoadMoreHeaders extends HeaderListEvent {}
