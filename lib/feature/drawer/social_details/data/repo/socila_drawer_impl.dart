// lib/feature/drawer/social_details/data/repository/social_drawer_repository_impl.dart

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/social_details/domain/entity/socila_drawer_filter_step.dart';
import 'package:e_member_app/feature/drawer/social_details/domain/repo/socila_drawer_repo.dart';


class SocialDrawerRepositoryImpl implements SocialDrawerRepository {
  final MemberDropRepositoryImpl _memberDropRepo;

  SocialDrawerRepositoryImpl(this._memberDropRepo);

  @override
  Future<List<SocialFilterStep>> getAllSocialSteps() async {
    try {
      // Fetch from APIs based on positions from document 1
      // Position 16: Pension Types (പെൻഷൻ തരം)
      final pensionTypes = await _memberDropRepo.getPensionTypes();
      
      // Position 17: Pension Requirements (പെൻഷൻ ആവശ്യമുണ്ടോ)
      final pensionRequirements = await _memberDropRepo.getPensionRequirement();

      // Create yes/no options
      final yesNoOptions = [
        MemberDropItem(id: '1', name: 'ഉണ്ട്'),
        MemberDropItem(id: '0', name: 'ഇല്ല'),
      ];

      // Hardcoded poverty alleviation options (no API available for this)
      final povertyAlleviationOptions = [
        MemberDropItem(id: '1', name: 'തൊഴിലുറപ്പ്'),
        MemberDropItem(id: '2', name: 'കുടുംബശ്രീ'),
        MemberDropItem(id: '3', name: 'ഹരിത കർമ്മസേന'),
        MemberDropItem(id: '0', name: 'അല്ല'),
      ];

      return [
        SocialFilterStep(
          name: 'റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ',
          options: yesNoOptions,
          position: 0,
          type: SocialStepType.yesNo,
        ),
        SocialFilterStep(
          name: 'പെൻഷൻ ലഭിക്കുന്നുണ്ടോ',
          options: yesNoOptions,
          position: 1,
          type: SocialStepType.yesNo,
        ),
        SocialFilterStep(
          name: 'പെൻഷൻ തരം',
          options: pensionTypes,
          position: 16,
          type: SocialStepType.dropdown,
        ),
        SocialFilterStep(
          name: 'പെൻഷൻ ആവശ്യമുണ്ടോ',
          options: pensionRequirements,
          position: 17,
          type: SocialStepType.dropdown,
        ),
        SocialFilterStep(
          name: 'നിങ്ങൾ ദാരിദ്ര്യ നിർമ്മാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ',
          options: povertyAlleviationOptions,
          position: 0,
          type: SocialStepType.hardcoded,
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load social steps: $e');
    }
  }
}