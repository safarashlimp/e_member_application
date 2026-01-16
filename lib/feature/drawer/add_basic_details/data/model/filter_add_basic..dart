import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';

class FilterData {
  static const List<FilterStep> basicDetailsSteps = [
    FilterStep(
      name: "വീടിന്റെ തരം",
      options: ["ഓട് / ഷീറ്റ്", "കോൺക്രീറ്റ്", "ഭൂരഹിതൻ", "താൽക്കാലികം"],
    ),
    FilterStep(
      name: "ഭൂമിയുടെ തരം",
      options: ["പട്ടയം", "പുറമ്പോക്ക്"],
    ),
    FilterStep(
      name: "ശൗചാലയം",
      options: ["ഉണ്ട്", "ഇല്ല"],
    ),
    FilterStep(
      name: "വൈദ്യുതി കണക്ഷൻ",
      options: ["ഉണ്ട്", "ഇല്ല"],
    ),
    FilterStep(
      name: "കുടിവെളള സൗകര്യം",
      options: ["ട്യൂബ് കിണർ", "പൊതു പൈപ്പ്", "മറ്റു മാർഗങ്ങൾ", "സ്വന്തം കിണർ"],
    ),
    FilterStep(
      name: "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ",
      options: ["ഉണ്ട്", "ഇല്ല"],
    ),
    FilterStep(
      name: "ലഭിച്ച ആനുകൂല്യം",
      options: ["പി.എം.എ.വൈ", "മറ്റുള്ളവ", "ലൈഫ് മിഷൻ", "വീട് അറ്റകുറ്റപ്പണി", "സ്ഥലം"],
    ),
    FilterStep(
      name: "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ",
      options: ["ഉണ്ട്", "ഇല്ല"],
    ),
    FilterStep(
      name: "ആവശ്യമുള്ള ആനുകൂല്യം",
      options: [
        "ആട്",
        "കുടിവെള്ളം",
        "കോഴി",
        "തൊഴുത്ത്",
        "പതറൾ",
        "മറ്റുള്ളവ",
        "വീട്",
        "വീട് അറ്റകുറ്റപ്പണി",
        "വൈദ്യുതി കണക്ഷൻ",
        "ശൗചാലയം",
        "സ്ഥലം"
      ],
    ),
    FilterStep(
      name: "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ",
      options: ["ഡ്രൈനേജ്", "പ്ലേറ്റ്", "മറ്റുള്ളവ", "റോഡ്"],
    ),
  ];
}