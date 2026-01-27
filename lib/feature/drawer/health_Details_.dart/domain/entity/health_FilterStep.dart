// lib/feature/drawer/health_Details_.dart/domain/entity/health_filter_step.dart

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

class HealthFilterStep {
  final String name;
  final List<MemberDropItem> options;
  final int position;
  final HealthStepType type; // To differentiate yes/no vs dropdown

  const HealthFilterStep({
    required this.name,
    required this.options,
    required this.position,
    required this.type,
  });

  HealthFilterStep copyWith({
    String? name,
    List<MemberDropItem>? options,
    int? position,
    HealthStepType? type,
  }) {
    return HealthFilterStep(
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
      type: type ?? this.type,
    );
  }
}

enum HealthStepType {
  yesNo, // For steps that need yes/no (will use hardcoded values)
  dropdown, // For steps that need API data
}

class HealthYesNoOption {
  final String displayText;
  final String value; // "1" for yes, "0" for no

  const HealthYesNoOption({
    required this.displayText,
    required this.value,
  });

  static const yes = HealthYesNoOption(displayText: 'അതെ', value: '1');
  static const no = HealthYesNoOption(displayText: 'അല്ല', value: '0');
}