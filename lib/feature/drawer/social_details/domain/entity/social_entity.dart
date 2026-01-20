// lib/feature/drawer/social_details/domain/entity/social_entity.dart

class SocialDrawerFilter {
  final String? includedInRationCard; // Will store "1" or "0"
  final String? receivingPension; // Will store "1" or "0"
  final String? pensionType; // Will store pension type ID (only if receiving pension)
  final String? needPension; // Will store pension requirement ID
  final String? povertyAlleviationMember; // For poverty alleviation programs (hardcoded options)

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

  Map<String, dynamic> toMap() {
    return {
      if (includedInRationCard != null) 'included_in_ration_card': includedInRationCard,
      if (receivingPension != null) 'receiving_pension': receivingPension,
      if (pensionType != null) 'pension_type_id': pensionType,
      if (needPension != null) 'pension_requirement_id': needPension,
      if (povertyAlleviationMember != null) 'poverty_alleviation_program': povertyAlleviationMember,
    };
  }
}