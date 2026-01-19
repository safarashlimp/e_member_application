class SocialDrawerFilter {
  final String? includedInRationCard;
  final String? receivingPension;
  final String? pensionType;
  final String? needPension;
  final String? povertyAlleviationMember;

  const SocialDrawerFilter({
    this.includedInRationCard,
    this.receivingPension,
    this.pensionType,
    this.needPension,
    this.povertyAlleviationMember,
  });

  SocialDrawerFilter copyWith({
    String? includedInRationCard,
    String? receivingPension,
    String? pensionType,
    String? needPension,
    String? povertyAlleviationMember,
  }) {
    return SocialDrawerFilter(
      includedInRationCard: includedInRationCard ?? this.includedInRationCard,
      receivingPension: receivingPension ?? this.receivingPension,
      pensionType: pensionType ?? this.pensionType,
      needPension: needPension ?? this.needPension,
      povertyAlleviationMember: povertyAlleviationMember ?? this.povertyAlleviationMember,
    );
  }

  bool get isComplete {
    return includedInRationCard != null &&
        receivingPension != null &&
        pensionType != null &&
        needPension != null &&
        povertyAlleviationMember != null;
  }

  Map<String, String?> toMap() {
    return {
      'includedInRationCard': includedInRationCard,
      'receivingPension': receivingPension,
      'pensionType': pensionType,
      'needPension': needPension,
      'povertyAlleviationMember': povertyAlleviationMember,
    };
  }
}