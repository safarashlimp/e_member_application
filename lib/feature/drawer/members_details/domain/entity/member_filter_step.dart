// lib/feature/drawer/members_details/domain/entity/member_filter_step.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';



class MemberFilterStep {
  final String name;
  final List<FilterOption> options;
  final int position; // API position

  const MemberFilterStep({
    required this.name,
    required this.options,
    required this.position,
  });

  MemberFilterStep copyWith({
    String? name,
    List<FilterOption>? options,
    int? position,
  }) {
    return MemberFilterStep(
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
    );
  }
}