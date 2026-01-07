class MemberDropResponse {
  final bool status;
  final List<MemberDropItem> data;

  MemberDropResponse({required this.status, required this.data});

  factory MemberDropResponse.fromJson(Map<String, dynamic> json) {
    return MemberDropResponse(
      status: json['Status'] == "true",
      data: (json['data'] as List)
          .map((e) => MemberDropItem.fromJson(e))
          .toList(),
    );
  }
}

class MemberDropItem {
  final String id;
  final String name;

  MemberDropItem({required this.id, required this.name});

  factory MemberDropItem.fromJson(Map<String, dynamic> json) {
    return MemberDropItem(
      id: json['id'],
      name: json['name'],
    );
  }

  
}
