abstract class FamilyMemberListEvent {}

class FetchFamilyMemberList extends FamilyMemberListEvent {
  final String position; // editId

  FetchFamilyMemberList(this.position);
}
