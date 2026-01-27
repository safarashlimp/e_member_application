// lib/feature/drawer/job_details/domain/entity/job_filter_step.dart

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

class JobFilterStep {
  final String name;
  final List<MemberDropItem> options;
  final int position;

  const JobFilterStep({
    required this.name,
    required this.options,
    required this.position,
  });

  JobFilterStep copyWith({
    String? name,
    List<MemberDropItem>? options,
    int? position,
  }) {
    return JobFilterStep(
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
    );
  }
}