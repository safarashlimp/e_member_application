import 'package:e_member_app/feature/drawer/social_details/domain/entity/social_entity.dart';

class SocialDrawerModel {
  final String? includedInRationCard;
  final String? receivingPension;
  final String? pensionType;
  final String? needPension;
  final String? povertyAlleviationMember;

  const SocialDrawerModel({
    this.includedInRationCard,
    this.receivingPension,
    this.pensionType,
    this.needPension,
    this.povertyAlleviationMember,
  });

  factory SocialDrawerModel.fromEntity(SocialDrawerFilter entity) {
    return SocialDrawerModel(
      includedInRationCard: entity.includedInRationCard,
      receivingPension: entity.receivingPension,
      pensionType: entity.pensionType,
      needPension: entity.needPension,
      povertyAlleviationMember: entity.povertyAlleviationMember,
    );
  }

  SocialDrawerFilter toEntity() {
    return SocialDrawerFilter(
      includedInRationCard: includedInRationCard,
      receivingPension: receivingPension,
      pensionType: pensionType,
      needPension: needPension,
      povertyAlleviationMember: povertyAlleviationMember,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'includedInRationCard': includedInRationCard,
      'receivingPension': receivingPension,
      'pensionType': pensionType,
      'needPension': needPension,
      'povertyAlleviationMember': povertyAlleviationMember,
    };
  }

  factory SocialDrawerModel.fromJson(Map<String, dynamic> json) {
    return SocialDrawerModel(
      includedInRationCard: json['includedInRationCard'],
      receivingPension: json['receivingPension'],
      pensionType: json['pensionType'],
      needPension: json['needPension'],
      povertyAlleviationMember: json['povertyAlleviationMember'],
    );
  }
}