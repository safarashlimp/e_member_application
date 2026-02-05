// lib/feature/drawer/social_details/domain/repository/social_drawer_repository.dart

import 'package:e_member_app/feature/drawer/social_details/domain/entity/socila_drawer_filter_step.dart';

abstract class SocialDrawerRepository {
  Future<List<SocialFilterStep>> getAllSocialSteps();
}