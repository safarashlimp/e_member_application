// lib/feature/drawer/social_details/domain/entity/social_filter_step.dart

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

class SocialFilterStep {
  final String name;
  final List<MemberDropItem> options;
  final int position;
  final SocialStepType type;

  const SocialFilterStep({
    required this.name,
    required this.options,
    required this.position,
    required this.type,
  });

  SocialFilterStep copyWith({
    String? name,
    List<MemberDropItem>? options,
    int? position,
    SocialStepType? type,
  }) {
    return SocialFilterStep(
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
      type: type ?? this.type,
    );
  }
}

enum SocialStepType {
  yesNo, // For റേഷൻ കാർഡിൽ, പെൻഷൻ ലഭിക്കുന്നുണ്ടോ
  dropdown, // For API-based data
  hardcoded, // For poverty alleviation (no API available)
}