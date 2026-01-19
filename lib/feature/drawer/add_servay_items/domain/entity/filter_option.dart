class FilterOption {
  final String id;
  final String label;
  final List<String> options;
  final Map<String, String>? metadata; // Store API IDs here

  const FilterOption({
    required this.id,
    required this.label,
    required this.options,
    this.metadata,
  });

  FilterOption copyWith({
    String? id,
    String? label,
    List<String>? options,
    Map<String, String>? metadata,
  }) {
    return FilterOption(
      id: id ?? this.id,
      label: label ?? this.label,
      options: options ?? this.options,
      metadata: metadata ?? this.metadata,
    );
  }
}