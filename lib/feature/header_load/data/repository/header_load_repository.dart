abstract class HeaderLoadRepository {
  Future<Map<String, dynamic>> fetchHeader({
    required String clientId,
    required String position,
    required String editId,
  });
}
