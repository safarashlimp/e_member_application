// class FilterSelection {
//   final Map<String, String?> selections;

//   const FilterSelection({required this.selections});

//   FilterSelection copyWith({Map<String, String?>? selections}) {
//     return FilterSelection(
//       selections: selections ?? this.selections,
//     );
//   }

//   FilterSelection updateSelection(String key, String? value) {
//     final newSelections = Map<String, String?>.from(selections);
//     newSelections[key] = value;
//     return FilterSelection(selections: newSelections);
//   }

//   FilterSelection clearAll() {
//     final clearedSelections = Map<String, String?>.from(selections);
//     clearedSelections.updateAll((key, value) => null);
//     return FilterSelection(selections: clearedSelections);
//   }
// }

class FilterSelection {
  final Map<String, String?> selections;

  const FilterSelection({
    required this.selections,
  });

  FilterSelection copyWith({
    Map<String, String?>? selections,
  }) {
    return FilterSelection(
      selections: selections ?? this.selections,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FilterSelection) return false;
    
    if (selections.length != other.selections.length) return false;
    
    for (final key in selections.keys) {
      if (selections[key] != other.selections[key]) return false;
    }
    
    return true;
  }

  @override
  int get hashCode => selections.hashCode;
}