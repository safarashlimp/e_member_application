
class FetchDetailLoad extends FamilyMemberDetailLoadEvent {
  final String editId;
  final String position;

  FetchDetailLoad({
    required this.editId,
    required this.position,
  });
}

class FamilyMemberDetailLoadEvent {
}

