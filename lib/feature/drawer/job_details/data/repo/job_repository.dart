// lib/feature/drawer/job_details/data/repository/job_drawer_repository_impl.dart

import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_fitlre_step.dart';
import 'package:e_member_app/feature/drawer/job_details/domain/repo/job_repo_model.dart';

class JobDrawerRepositoryImpl implements JobDrawerRepository {
  final MemberDropRepositoryImpl _memberDropRepo;

  JobDrawerRepositoryImpl(this._memberDropRepo);

  @override
  Future<List<JobFilterStep>> getAllJobSteps() async {
    try {
      // Fetch from APIs based on positions from document 1
      // Position 8: Employment Status (തൊഴിൽ നില)
      final employmentStatus = await _memberDropRepo.getEmploymentStatus();
      
      // Position 9: Jobs/Occupation (തൊഴിൽ)
      final jobs = await _memberDropRepo.getJobs();
      
      // Position 11: Employment Supports (തൊഴിൽ മേഖലയിൽ സഹായം)
      final employmentSupports = await _memberDropRepo.getEmploymentSupports();

      return [
        JobFilterStep(
          name: 'തൊഴിൽ നില',
          options: employmentStatus,
          position: 8,
        ),
        JobFilterStep(
          name: 'തൊഴിൽ',
          options: jobs,
          position: 9,
        ),
        JobFilterStep(
          name: 'തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ',
          options: employmentSupports,
          position: 11,
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load job steps: $e');
    }
  }
}