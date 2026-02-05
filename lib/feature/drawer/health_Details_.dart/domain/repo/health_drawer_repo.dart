// lib/feature/drawer/health_Details_.dart/domain/repository/health_drawer_repository.dart

import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_filter_step.dart';

abstract class HealthDrawerRepository {
  Future<List<HealthFilterStep>> getAllHealthSteps();
}