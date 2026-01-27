// lib/feature/drawer/education_details.dart/domain/entity/education_filter_step.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';


class EducationFilterStep {
  final String name;
  final List<FilterOption> options;
  final int position; // API position

  const EducationFilterStep({
    required this.name,
    required this.options,
    required this.position,
  });

  EducationFilterStep copyWith({
    String? name,
    List<FilterOption>? options,
    int? position,
  }) {
    return EducationFilterStep(
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
    );
  }
}