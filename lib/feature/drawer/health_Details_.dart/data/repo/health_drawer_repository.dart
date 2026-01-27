// lib/feature/drawer/health_Details_.dart/data/repository/health_drawer_repository_impl.dart

import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_FilterStep.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/repo/health_drawer_repo.dart';

class HealthDrawerRepositoryImpl implements HealthDrawerRepository {
  final MemberDropRepositoryImpl _memberDropRepo;

  HealthDrawerRepositoryImpl(this._memberDropRepo);

  @override
  Future<List<HealthFilterStep>> getAllHealthSteps() async {
    try {
      // Fetch required health supports from API (position 15)
      final healthSupports = await _memberDropRepo.getRequiredHealthSupports();

      // Create yes/no options
      final yesNoOptions = [
        MemberDropItem(id: '1', name: 'അതെ'),
        MemberDropItem(id: '0', name: 'അല്ല'),
      ];

      final yesNoOptionsDisability = [
        MemberDropItem(id: '1', name: 'ഉണ്ട്'),
        MemberDropItem(id: '0', name: 'ഇല്ല'),
      ];

      return [
        HealthFilterStep(
          name: 'രോഗിയാണോ',
          options: yesNoOptions,
          position: 0,
          type: HealthStepType.yesNo,
        ),
        HealthFilterStep(
          name: 'ഭിന്നശേഷിയുണ്ടോ',
          options: yesNoOptionsDisability,
          position: 1,
          type: HealthStepType.yesNo,
        ),
        HealthFilterStep(
          name: 'സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ',
          options: yesNoOptionsDisability,
          position: 2,
          type: HealthStepType.yesNo,
        ),
        HealthFilterStep(
          name: 'ഹെൽത്ത് ഇൻഷൂറൻസ് കാർഡ് ഉണ്ടോ',
          options: yesNoOptionsDisability,
          position: 3,
          type: HealthStepType.yesNo,
        ),
        HealthFilterStep(
          name: 'ആവശ്യമായ ആരോഗ്യ സഹായങ്ങൾ',
          options: healthSupports,
          position: 4,
          type: HealthStepType.dropdown,
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load health steps: $e');
    }
  }
}