// lib/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart
class FilterStep {
    final String key;   
  final String name;
  final List<FilterOption> options; // Changed from List<String>
  final int position;

  const FilterStep({
    required this.key,
    required this.name,
    required this.options,
    required this.position,
  });

  FilterStep copyWith( {
    String ? key,
    String? name,
    List<FilterOption>? options,
    int? position,
  }) {
    return FilterStep(
      key: key  ?? this.key,
      name: name ?? this.name,
      options: options ?? this.options,
      position: position ?? this.position,
    );
  }
}

// New class to hold both ID and Name
class FilterOption {
  final String id;
  final String name;

  const FilterOption({
    required this.id,
    required this.name,
  });
}