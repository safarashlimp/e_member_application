import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';

class FilterRepositoryImpl implements FilterRepository {
  final FamilyDropRepositoryImpl _familyDropRepo;

  FilterRepositoryImpl() : _familyDropRepo = FamilyDropRepositoryImpl();

  /// Malayalam label → English API key
  static const Map<String, String> _apiKeyMap = {
    "റേഷൻ കാർഡ്": "ration_card",
    "തൊഴിലുറപ്പ് കാർഡ": "job_card",
    "കുടുംബശ്രീ അംഗമാണോ": "kudumbashree_member",
    "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ": "government_benefits",
    "അതിദരിദ്ര കുടുംബമാണോ": "ultra_poor_family",
  };

  @override
  Future<List<FilterOption>> getFilterOptions() async {
    try {
      // Fetch ration card types from API
      final rationCards = await _familyDropRepo.rationCardType();

      // Convert API response to filter options
      final rationCardOptions = rationCards.map((card) => card.name).toList();

      return [
        FilterOption(
          id: "റേഷൻ കാർഡ്",
          label: "റേഷൻ കാർഡ്",
          options: rationCardOptions,
          // Store API IDs for later conversion
          metadata: {for (var card in rationCards) card.name: card.id},
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
    } catch (e) {
      return _getFallbackOptions();
    }
  }

  List<FilterOption> _getFallbackOptions() {
    return const [
      FilterOption(
        id: "റേഷൻ കാർഡ്",
        label: "റേഷൻ കാർഡ്",
        options: [
          "മഞ്ഞ (AAY)",
          "പിങ്ക് (PHH)",
          "നീല (NPHH)",
          "വെള്ള (NPNS)",
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
    // We'll populate this after loading filter options
    return FilterSelection(selections: initialSelections);
  }

  /// Yes / No → API value
  int _mapYesNo(String value) {
    return value == "ഉണ്ട്" ? 1 : 0;
  }

  @override
  Future<Map<String, dynamic>> submitFilters(
    FilterSelection selection,
    List<FilterOption> filterOptions,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final Map<String, dynamic> apiPayload = {};

    for (final option in filterOptions) {
      final selectedValue = selection.selections[option.id];
      if (selectedValue == null) continue;

      final apiKey = _apiKeyMap[option.id];
      if (apiKey == null) continue;

      /// Ration Card → send actual API ID
      if (option.id == "റേഷൻ കാർഡ്") {
        // Get the ID from metadata
        final cardId = option.metadata?[selectedValue];
        if (cardId != null) {
          apiPayload[apiKey] = cardId;
        }
      }

      /// Yes / No → send 1 or 0
      else {
        apiPayload[apiKey] = _mapYesNo(selectedValue);
      }
    }

    return apiPayload;
  }
}
