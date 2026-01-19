// lib/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart
class FilterStep {
  final String name;
  final List<String> options;
  final int position; // Position for API call (-1 means no API needed)

  const FilterStep({
    required this.name,
    required this.options,
    required this.position,
  });

  // Add copyWith method for updating options
  FilterStep copyWith({
    String? name,
    List<String>? options,
    int? position,
  }) {
    return FilterStep(
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
    );
  }
}