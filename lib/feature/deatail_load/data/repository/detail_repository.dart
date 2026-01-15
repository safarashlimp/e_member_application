abstract class FamilyMemberDetailsLoadRepository {
  Future<Map<String, dynamic>> fetchDetails({
    required String clientId,
    required String position,
    required String editId,
  });
}