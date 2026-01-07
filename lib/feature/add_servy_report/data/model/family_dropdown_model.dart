class FamilyDropResponse {
  final bool status;
  final List<FamilyDropItem> data;

  FamilyDropResponse({
    required this.status,
    required this.data,
  });

  factory FamilyDropResponse.fromJson(Map<String, dynamic> json) {
    return FamilyDropResponse(
      status: json['Status'] == "true",
      data: (json['data'] as List)
          .map((e) => FamilyDropItem.fromJson(e))
          .toList(),
    );
  }
}

class FamilyDropItem {
  final String id;
  final String name;

  FamilyDropItem({
    required this.id,
    required this.name,
  });

  factory FamilyDropItem.fromJson(Map<String, dynamic> json) {
    return FamilyDropItem(
      id: json['id'],
      name: json['name'],
    );
  }
}
