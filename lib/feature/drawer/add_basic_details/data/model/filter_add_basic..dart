// lib/feature/drawer/add_basic_details/data/model/filter_add_basic.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';

class FilterData {
  static const List<FilterStep> basicDetailsSteps = [
    FilterStep(
      name: "വീടിന്റെ തരം",
      options: [], // Will be filled from API position 2
      position: 2,
    ),
    FilterStep(
      name: "ഭൂമിയുടെ തരം",
      options: [], // Will be filled from API position 3
      position: 3,
    ),
    FilterStep(
      name: "ശൗചാലയം",
      options: ["ഉണ്ട്", "ഇല്ല"], // Static
      position: -1,
    ),
    FilterStep(
      name: "വൈദ്യുതി കണക്ഷൻ",
      options: ["ഉണ്ട്", "ഇല്ല"], // Static
      position: -1,
    ),
    FilterStep(
      name: "കുടിവെളള സൗകര്യം",
      options: [], // Will be filled from API position 4
      position: 4,
    ),
    FilterStep(
      name: "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ",
      options: ["ഉണ്ട്", "ഇല്ല"], // Static
      position: -1,
    ),
    FilterStep(
      name: "ലഭിച്ച ആനുകൂല്യം",
      options: [], // Will be filled from API position 5
      position: 5,
    ),
    FilterStep(
      name: "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ",
      options: ["ഉണ്ട്", "ഇല്ല"], // Static
      position: -1,
    ),
    FilterStep(
      name: "ആവശ്യമുള്ള ആനുകൂല്യം",
      options: [], // Will be filled from API position 6
      position: 6,
    ),
    FilterStep(
      name: "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ",
      options: [], // Will be filled from API position 7
      position: 7,
    ),
  ];
}