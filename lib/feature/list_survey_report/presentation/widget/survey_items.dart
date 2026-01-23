import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
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
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_event.dart';

import 'package:e_member_app/feature/add_family_members_list/presentation/view/add_family_members.dart';


import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/header_load/data/repository/header_load_repository_impl.dart';
import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_bloc.dart';
import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_event.dart';
import 'package:e_member_app/feature/header_load/presentation/view/header_load_gate.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PropertyCard extends StatefulWidget {
  // final SurveyHeaderModel? headerData;
  final String houseNumber;
  final String houseName;
  final String subtitle;
  final String memberCount;
  final String lastUpdated;
  final String editId;
  final String position;
  final FamilySurveySectionType sectionType;
  const PropertyCard({
    super.key,
    required this.editId,
    required this.position,
    required this.houseNumber,
    required this.houseName,
    required this.subtitle,
    required this.memberCount,
    required this.lastUpdated,
    required this.sectionType,
    // required this.headerData,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
void openWithLoad(BuildContext context, PageMode mode) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        // ✅ Only create HeaderLoadBloc here
        create: (_) => HeaderLoadBloc(
          HeaderLoadRepositoryImpl(http.Client()),
        )..add(
            FetchHeaderLoad(
              editId: widget.editId,
              position: widget.position,
            ),
          ),
        child: HeaderLoadGate(
          mode: mode,
          position: widget.position,
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // House Icon and Title
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColor.white1,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/home.png',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fill,
                  color: AppColor.iconColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.houseNumber,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '|',
                          style: TextStyle(fontSize: 13, color: AppColor.black),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.houseName,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.subtitle,
                      style: TextStyle(fontSize: 14, color: AppColor.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Divider(color: AppColor.grey1, thickness: 1),
          const SizedBox(height: 7),
          // Member Count
          Row(
            children: [
              Image.asset(
                'assets/icons/family_icon.png',
                width: 12,
                height: 12,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const Icon(
                    Icons.family_restroom,
                    size: 12,
                    color: AppColor.primary,
                  );
                },
              ),
              const SizedBox(width: 6),
              Text(
                'അംഗങ്ങൾ: ${widget.memberCount}',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),

          // Last Updated
          Row(
            children: [
              Icon(Icons.update, size: 16, color: AppColor.primary),
              const SizedBox(width: 6),
              Text(
                widget.lastUpdated,
                style: TextStyle(fontSize: 13, color: AppColor.lightGrey),
              ),
            ],
          ),
          const SizedBox(height: 13),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 57,
                height: 23,
                child: OutlinedButton.icon(
                  onPressed: () => openWithLoad(context, PageMode.view),
                  icon: const Icon(
                    Icons.visibility,
                    size: 14,
                    color: AppColor.button,
                  ),
                  label: const Text(
                    'View',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.iconColor,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(color: AppColor.iconColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                width: 57,
                height: 23,
                child: OutlinedButton.icon(
                  onPressed: () => openWithLoad(context, PageMode.edit),
                  icon: const Icon(
                    Icons.edit,
                    size: 14,
                    color: AppColor.button,
                  ),
                  label: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.iconColor,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(color: AppColor.iconColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 24,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (_) =>
                                  RelationDropBloc(MemberDropRepositoryImpl())
                                    ..add(FetchRelations()),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  MaritalStatusBloc(MemberDropRepositoryImpl())
                                    ..add(FetchMaritalStatus()),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  CasteBloc(MemberDropRepositoryImpl())
                                    ..add(FetchCastes()),
                            ),
                            BlocProvider(
                              create: (_) => QualificationBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchQualifications()),
                            ),
                            BlocProvider(
                              create: (_) => EducationBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchEducation()),
                            ),
                            BlocProvider(
                              create: (_) => EmploymentStatusBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchEmploymentStatus()),
                            ),
                            BlocProvider(
                              create: (_) => JobBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchJobs()),
                            ),
                            BlocProvider(
                              create: (_) => EmploymentSupportBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchEmploymentSupports()),
                            ),
                            BlocProvider(
                              create: (_) => FarmingTypeBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchFarmingTypes()),
                            ),
                            BlocProvider(
                              create: (_) => HealthIssueBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchHealthIssues()),
                            ),
                            BlocProvider(
                              create: (_) => HealthInsuranceBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchHealthInsurance()),
                            ),
                            BlocProvider(
                              create: (_) => RequiredHealthSupportBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchRequiredHealthSupports()),
                            ),
                            BlocProvider(
                              create: (_) => PensionTypeBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchPensionTypes()),
                            ),
                            BlocProvider(
                              create: (_) => PensionRequiredBloc(
                                MemberDropRepositoryImpl(),
                              )..add(FetchPensionRequirement()),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  SkillsBloc(MemberDropRepositoryImpl())
                                    ..add(FetchSkills()),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  BloodGroupBloc(MemberDropRepositoryImpl())
                                    ..add(FetchBloodGroups()),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  ReligionBloc(MemberDropRepositoryImpl())
                                    ..add(FetchReligion()),
                            ),
                            BlocProvider(
                              create: (_) =>
                                  GenderBloc(MemberDropRepositoryImpl())
                                    ..add(FetchGender()),
                            ),
                          ],
                          child: AddFamilyMembers(
                            editId: widget.editId,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 14,
                    color: AppColor.white,
                  ),
                  label: const Text(
                    'അംഗം ചേർക്കുക',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(4),
                    backgroundColor: AppColor.button,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: AppColor.iconColor,
                        width: 1,
                      ),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              const SizedBox(width: 63),
            ],
          ),
        ],
      ),
    );
  }
}
