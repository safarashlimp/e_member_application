import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';

class FilterRepositoryImpl implements FilterRepository {

  /// Malayalam label → English API key
  static const Map<String, String> _apiKeyMap = {
    "റേഷൻ കാർഡ്": "ration_card",
    "തൊഴിലുറപ്പ് കാർഡ": "job_card",
    "കുടുംബശ്രീ അംഗമാണോ": "kudumbashree_member",
    "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ": "government_benefits",
    "അതിദരിദ്ര കുടുംബമാണോ": "ultra_poor_family",
  };

  @override
  List<FilterOption> getFilterOptions() {
    return const [
      FilterOption(
        id: "റേഷൻ കാർഡ്",
        label: "റേഷൻ കാർഡ്",
        options: [
          "മഞ്ഞ (AAY)",     // index 0
          "പിങ്ക് (PHH)",   // index 1
          "നീല (NPHH)",    // index 2
          "വെള്ള (NPNS)",  // index 3
        ],
      ),
      FilterOption(
        id: "തൊഴിലുറപ്പ് കാർഡ",
        label: "തൊഴിലുറപ്പ് കാർഡ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
      FilterOption(
        id: "കുടുംബശ്രീ അംഗമാണോ",
        label: "കുടുംബശ്രീ അംഗമാണോ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
      FilterOption(
        id: "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ",
        label: "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
      FilterOption(
        id: "അതിദരിദ്ര കുടുംബമാണോ",
        label: "അതിദരിദ്ര കുടുംബമാണോ",
        options: ["ഉണ്ട്", "ഇല്ല"],
      ),
    ];
  }

  @override
  FilterSelection getInitialSelections() {
    final Map<String, String?> initialSelections = {};
    for (final option in getFilterOptions()) {
      initialSelections[option.id] = null;
    }
    return FilterSelection(selections: initialSelections);
  }

  /// Yes / No → API value
  int _mapYesNo(String value) {
    return value == "ഉണ്ട്" ? 1 : 0;
  }

  @override
  Future<void> submitFilters(FilterSelection selection) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final List<FilterOption> options = getFilterOptions();
    final Map<String, dynamic> apiPayload = {};

    for (final option in options) {
      final selectedValue = selection.selections[option.id];
      if (selectedValue == null) continue;

      final apiKey = _apiKeyMap[option.id];
      if (apiKey == null) continue;

      /// Ration Card → send index position
      if (option.id == "റേഷൻ കാർഡ്") {
        apiPayload[apiKey] = option.options.indexOf(selectedValue);
      }
      /// Yes / No → send 1 or 0
      else {
        apiPayload[apiKey] = _mapYesNo(selectedValue);
      }
    }

    /// FINAL API REQUEST DATA
    print("API Payload: $apiPayload");
  }
}
