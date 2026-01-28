class RationCard {
  final int id;
  final String name;

  RationCard({required this.id, required this.name});

  factory RationCard.fromJson(Map<String, dynamic> json) {
    return RationCard(
      id: int.parse(json['id']),
      name: json['name'],
    );
  }
}
