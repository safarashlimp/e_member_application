class HeaderListResponse {
  final bool status;
  final List<HeaderItem> data;

  HeaderListResponse({required this.status, required this.data});

  factory HeaderListResponse.fromJson(Map<String, dynamic> json) {
    return HeaderListResponse(
      status: json['Status'],
      data: (json['data'] as List)
          .map((e) => HeaderItem.fromJson(e))
          .toList(),
    );
  }
}

class HeaderItem {
  final String editId;
  final String houseChief;
  final String houseNumber;
  final String houseName;
  final String memberCount;
  final DateTime lastModified;
  final String position;

  HeaderItem({
    required this.editId,
    required this.houseChief,
    required this.houseNumber,
    required this.houseName,
    required this.memberCount,
    required this.lastModified,
    required this.position,
  });

  factory HeaderItem.fromJson(Map<String, dynamic> json) {
    return HeaderItem(
      editId: json['editid'],
      houseChief: json['house_chief'],
      houseNumber: json['house_number'],
      houseName: json['house_name'],
      memberCount: json['member_count'],
      lastModified: DateTime.parse(json['last_modified']),
      position: json['posistion'],
    );
  }
}
