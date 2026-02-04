import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_event.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/splash/presentaion/splashscreen.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/education/education_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/farming%20type/farming_bloc_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/farming%20type/farming_bloc_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/gender_bloc/gender_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/gender_bloc/gender_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health%20issue/health_issue_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health%20issue/health_issue_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health_insurance/health_insurance_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/jobs/job_bloc.dart';

import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
     
    final repo = MemberDropRepositoryImpl();
 final datasource = DashboardRemoteDatasource();
          final repository = DashboardRepositoryImpl(datasource);
          final useCase = GetDashboardUseCase(repository);

        
    return ScreenUtilInit(
      designSize: const Size(390, 844), // 👈 Your design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
               BlocProvider(
            create: (_) => DashboardBloc(useCase)..add(LoadDashboardEvent())),
          
              BlocProvider(
                create: (_) => RationCardBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchRationCards()),
              ),
              BlocProvider(
                create: (_) => RelationDropBloc(repo)..add(FetchRelations()),
              ),
              BlocProvider(
                create: (_) =>
                    MaritalStatusBloc(repo)..add(FetchMaritalStatus()),
              ),
              BlocProvider(
                create: (_) => CasteBloc(repo)..add(FetchCastes()),
              ),
              BlocProvider(
                create: (_) => QualificationBloc(
                  repo,
                )..add(FetchQualifications()),
              ),
              BlocProvider(
                create: (_) => EducationBloc(
                  repo,
                )..add(FetchEducation()),
              ),
              BlocProvider(
                create: (_) => EmploymentStatusBloc(
                  repo,
                )..add(FetchEmploymentStatus()),
              ),
              BlocProvider(
                create: (_) => JobBloc(
                  repo,
                )..add(FetchJobs()),
              ),
              BlocProvider(
                create: (_) => EmploymentSupportBloc(
                  repo,
                )..add(FetchEmploymentSupports()),
              ),
              BlocProvider(
                create: (_) => FarmingTypeBloc(
                  repo,
                )..add(FetchFarmingTypes()),
              ),
              BlocProvider(
                create: (_) => HealthIssueBloc(
                  repo,
                )..add(FetchHealthIssues()),
              ),
              BlocProvider(
                create: (_) => HealthInsuranceBloc(
                  repo,
                )..add(FetchHealthInsurance()),
              ),
              BlocProvider(
                create: (_) => RequiredHealthSupportBloc(
                  repo,
                )..add(FetchRequiredHealthSupports()),
              ),
              BlocProvider(
                create: (_) => PensionTypeBloc(
                  repo,
                )..add(FetchPensionTypes()),
              ),
              BlocProvider(
                create: (_) => PensionRequiredBloc(
                  repo,
                )..add(FetchPensionRequirement()),
              ),
              BlocProvider(
                create: (_) => SkillsBloc(repo)..add(FetchSkills()),
              ),
              BlocProvider(
                create: (_) => BloodGroupBloc(repo)..add(FetchBloodGroups()),
              ),
              BlocProvider(
                create: (_) => ReligionBloc(repo)..add(FetchReligion()),
              ),
              BlocProvider(
                create: (_) => GenderBloc(repo)..add(FetchGender()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Splashscreen(),
            ));
      },
    );
  }
}
