// lib/feature/drawer/add_basic_details/data/model/filter_add_basic.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';

class FilterData {
  static const List<FilterStep> basicDetailsSteps = [
    FilterStep(
      key: "houseType",
      name: "വീടിന്റെ തരം",
    
      options: [], // Will be filled from API position 2
      position: 2,
    ),
    FilterStep(
      key: "landType",
      name: "ഭൂമിയുടെ തരം",
      options: [], // Will be filled from API position 3
      position: 3,
    ),
    FilterStep(
      key: "hasToilet",
      name: "ശൗചാലയം",
      options: [
        FilterOption(id: "1", name: "ഉണ്ട്"),
        FilterOption(id: "0", name: "ഇല്ല"),
      ],
      position: -1,
    ),
    FilterStep(
       key:  "hasElectricCity",
      name: "വൈദ്യുതി കണക്ഷൻ",
      options: [
        FilterOption(id: "1", name: "ഉണ്ട്"),
        FilterOption(id: "0", name: "ഇല്ല"),
      ],
      position: -1,
    ),
    FilterStep(
      key:  "hasDrinkingWater",
      name: "കുടിവെളള സൗകര്യം",
      options: [], // Will be filled from API position 4
      position: 4,
    ),
    FilterStep(
      key:  "benefitsReceived",
      name: "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ",
      options: [
        FilterOption(id: "1", name: "ഉണ്ട്"),
        FilterOption(id: "0", name: "ഇല്ല"),
      ],
      position: -1,
    ),
    FilterStep(
        key: "requiredBenefit",
      name: "ലഭിച്ച ആനുകൂല്യം",
      options: [], // Will be filled from API position 5
      position: 5,
    ),
    FilterStep(
      key: "benefitsWanted",
      name: "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ",
      options: [
        FilterOption(id: "1", name: "ഉണ്ട്"),
        FilterOption(id: "0", name: "ഇല്ല"),
      ],
      position: -1,
    ),
    FilterStep(
      key: "OtherBenefit",
      name: "ആവശ്യമുള്ള ആനുകൂല്യം",
      options: [], // Will be filled from API position 6
      position: 6,
    ),
    FilterStep(
      key: "generalNeed",
      name: "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ",
      options: [], // Will be filled from API position 7
      position: 7,
    ),
  ];
}