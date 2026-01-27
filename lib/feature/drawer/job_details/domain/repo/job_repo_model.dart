// lib/feature/drawer/job_details/domain/repository/job_drawer_repository.dart

import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_fitlre_step.dart';

abstract class JobDrawerRepository {
  Future<List<JobFilterStep>> getAllJobSteps();
}