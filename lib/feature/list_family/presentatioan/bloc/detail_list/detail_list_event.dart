abstract class FamilyMemberListEvent {}

class FetchFamilyMemberList extends FamilyMemberListEvent {
  final String position;
  final bool loadMore; // To distinguish initial load from pagination

  FetchFamilyMemberList(this.position, {this.loadMore = false});
}

class LoadMoreFamilyMembers extends FamilyMemberListEvent {}
