// lib/feature/drawer/education_details.dart/presentaion/constant/education_constants.dart
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_filter_step.dart';

class EducationConstants {
  // API Position mapping:
  // Educational Qualification - position 6
  // Currently Studying - static (Yes=1, No=0)
  
  static const List<EducationFilterStep> steps = [
    EducationFilterStep(
      name: "വിദ്യാഭ്യാസ യോഗ്യത",
      options: [], // Will be filled from member_drops.php?position=6
      position: 6,
    ),
    EducationFilterStep(
      name: "ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ",
      options: [
        FilterOption(id: "1", name: "ഉണ്ട്"),
        FilterOption(id: "0", name: "ഇല്ല"),
      ],
      position: -1, // Static data
    ),
  ];
}