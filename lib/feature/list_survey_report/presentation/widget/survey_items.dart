import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/blood_group/blood_group_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/blood_group/blood_group_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/employment%20support/employment_suppor_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/employment%20support/employment_suppor_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/emloyment/employment_status_dart_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/emloyment/employment_status_dart_event.dart';

import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/caste/caste_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/caste/caste_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/education/education_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/farming%20type/farming_bloc_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/farming%20type/farming_bloc_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/health%20issue/health_issue_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/health%20issue/health_issue_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/health_insurance/health_insurance_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/jobs/job_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/marital_status/maritalstatus_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/marital_status/maritalstatus_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/pansion_type/pansion_type_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/pansion_type/pansion_type_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/pension_required/pension_required_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/pension_required/pension_required_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/qualification/qualification_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/qualification/qualification_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/relation_drop/relation_drop_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/relation_drop/relation_drop_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/required_health/requried_health_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/required_health/requried_health_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/skill/skill_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/skill/skill_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/view/add_family_members.dart';

import 'package:e_member_app/feature/add_servy_report/presentation/view/add_item_basic_details.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
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
//      void onViewTap(BuildContext context) {
//  late Widget page;

//   switch (widget.sectionType) {
//     case FamilySurveySectionType.familyBasicDetails:
//       page = const AddServyItems(mode: PageMode.view);
//       break;
//     case FamilySurveySectionType.basicFacilities:
//       page = AddItemBasicDetails(mode: PageMode.view,   );
//       break;
 
//   }

//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (_) => page),
//   );
// }
//   void onEditTap(BuildContext context) {
//  late Widget page;

//   switch (widget.sectionType) {
//     case FamilySurveySectionType.familyBasicDetails:
//       page = const AddServyItems(mode: PageMode.edit);
//       break;
//     case FamilySurveySectionType.basicFacilities:
//       page = AddItemBasicDetails(mode: PageMode.edit,);
//       break;
//   }

//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (_) => page),
//   );
// }

void openWithLoad(BuildContext context, PageMode mode) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BlocProvider(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                   // add contition
                   openWithLoad(context, PageMode.view);
                  },
                  icon: const Icon(
                    Icons.visibility,
                    size: 14,
                    color: AppColor.button,
                  ),
                  label: const Text(
                    'View',
                    style: TextStyle(
                      color: AppColor.iconColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColor.iconColor,
                    side: const BorderSide(color: AppColor.iconColor),
                    minimumSize: const Size(144, 23),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 4,
                      right: 4,
                      bottom: 4,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: OutlinedButton.icon(
                  //add contition
                  onPressed: () {
                    openWithLoad(context, PageMode.edit);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AddServyItems()),
                    // );
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 14,
                    color: AppColor.button,
                  ),
                  label: const Text(
                    'Edit',
                    style: TextStyle(
                      color: AppColor.iconColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColor.iconColor,
                    side: const BorderSide(color: AppColor.iconColor),
                    minimumSize: const Size(144, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 4,
                      right: 4,
                      bottom: 4,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                height: 24,
                child: Expanded(
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
      SkillsBloc(MemberDropRepositoryImpl())..add(FetchSkills()),
),
BlocProvider(
  create: (_) =>
      BloodGroupBloc(MemberDropRepositoryImpl())..add(FetchBloodGroups()),
),

      ],
      child: AddFamilyMembers(),
    ),
  ),
);

},

                    icon: const Icon(
                      Icons.add,
                      size: 12,
                      color: AppColor.white,
                    ),
                    label: const Text(
                      'അംഗം ചേർക്കുക',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.button,
                      foregroundColor: Colors.white,

                      elevation: 0,
                      // minimumSize: const Size(144, 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: AppColor.iconColor, // 👈 border color
                          width: 1, // 👈 border thickness
                        ),
                      ),

                      padding: const EdgeInsets.only(
                        top: 4,
                        left: 4,
                        right: 4,
                        bottom: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
