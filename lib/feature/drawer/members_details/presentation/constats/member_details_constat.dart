// lib/feature/drawer/members_details/presentation/constants/member_details_constant.dart
import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_filter_step.dart';

class MemberDetailsConstants {
  // API Position mapping:
  // Blood Group - special API endpoint
  // Gender - position 2
  // Marital Status - position 3
  // Religion - position 4
  // Caste - position 5
  
  static const List<MemberFilterStep> steps = [
    MemberFilterStep(
      name: "രക്തഗ്രൂപ്പ്",
      options: [], // Will be filled from blood_group.php API
      position: 100, // Special position for blood group API
    ),
    MemberFilterStep(
      name: "ലിംഗം",
      options: [], // Will be filled from member_drops.php?position=2
      position: 2,
    ),
    MemberFilterStep(
      name: "വിവാഹസ്ഥിതി",
      options: [], // Will be filled from member_drops.php?position=3
      position: 3,
    ),
    MemberFilterStep(
      name: "മതം",
      options: [], // Will be filled from member_drops.php?position=4
      position: 4,
    ),
    MemberFilterStep(
      name: "ജാതി",
      options: [], // Will be filled from member_drops.php?position=5
      position: 5,
    ),
  ];
}