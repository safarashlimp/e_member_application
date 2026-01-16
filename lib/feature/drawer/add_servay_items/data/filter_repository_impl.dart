
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';

class FilterRepositoryImpl implements FilterRepository {
  @override
  List<FilterOption> getFilterOptions() {
    return [
      const FilterOption(
        id: "റേഷൻ കാർഡ്",
        label: "റേഷൻ കാർഡ്",
        options: [" നീല (NPHH)", "പിങ്ക് (PHH)", "മഞ്ഞ (AAY)"," വെള്ള (NPNS)"],
      ),
      const FilterOption(
        id: "തൊഴിലുറപ്പ് കാർഡ",
        label: "തൊഴിലുറപ്പ് കാർഡ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
      const FilterOption(
        id: "കുടുംബശ്രീ അംഗമാണോ",
        label: "കുടുംബശ്രീ അംഗമാണോ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
      const FilterOption(
        id: "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ",
        label: "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
      const FilterOption(
        id: "അതിദരിദ്ര കുടുംബമാണോ",
        label: "അതിദരിദ്ര കുടുംബമാണോ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
    ];
  }

  @override
  FilterSelection getInitialSelections() {
    final options = getFilterOptions();
    final Map<String, String?> initialSelections = {};
    for (var option in options) {
      initialSelections[option.id] = null;
    }
    return FilterSelection(selections: initialSelections);
  }

  @override
  Future<void> submitFilters(FilterSelection selection) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    print('Submitting filters: ${selection.selections}');
  }
}