import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/education/education_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_event.dart' show FetchEmploymentStatus;
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
import 'package:e_member_app/feature/deatail_load/data/repository/detail_repository.dart';
import 'package:e_member_app/feature/deatail_load/data/repository/detail_repository_impl.dart';
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_bloc.dart';
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_event.dart';
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_state.dart';
import 'package:e_member_app/feature/deatail_load/presentation/view/detail_loaded_page.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_3rdpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_4thpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_5thpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_details_secondpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_firstpage_details_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MemberCard extends StatefulWidget {
  final String name;
  // final String position;
  final String houseNumber;
  final String houseName;
  final String phone;
  final String whatsapp;
  final String ward;
  final String age;
  final String editId;
  final String position;
  final String lastUpdated;
  final SurveySectionType sectionType;
  const MemberCard({
    super.key,
    required this.name,
    //  required this.position,
    required this.houseNumber,
    required this.houseName,
    required this.phone,
    required this.whatsapp,
    required this.editId,
    required this.position,
    required this.ward,
    required this.age,
    required this.lastUpdated,
    required this.sectionType,
  });

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  void onViewTap(BuildContext context, PageMode mode) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          // ✅ Main data loader
          BlocProvider(
            create: (context) => FamilyMemberDetailLoadBloc(
              FamilyMemberDetailsLoadRepositoryImpl(http.Client()),
            )..add(
                FetchDetailLoad(
                  editId: widget.editId,
                  position: widget.position,
                ),
              ),
          ),
          
          // ✅ Edit BLoC
          BlocProvider(
            create: (_) => EditFamilyMemberBloc(
              widget.position,
              familyMemberRepository: FamilyMemberRepository(),
              educationRepository: EducationDetailsRepository(),
              employmentRepository: EmploymentDetailsRepository(),
              healthRepository: HealthDetailsRepository(),
              pensionRepository: PensionDetailsRepository(),
            ),
          ),

          // ✅ ALL DROPDOWN BLOCS - These load in parallel with main data
          // Personal Details BLoCs
          BlocProvider(
            create: (_) => BloodGroupBloc(MemberDropRepositoryImpl())
              ..add(FetchBloodGroups()),
          ),
          BlocProvider(
            create: (_) => RelationDropBloc(MemberDropRepositoryImpl())
              ..add(FetchRelations()),
          ),
          BlocProvider(
            create: (_) => GenderBloc(MemberDropRepositoryImpl())
              ..add(FetchGender()),
          ),
          BlocProvider(
            create: (_) => MaritalStatusBloc(MemberDropRepositoryImpl())
              ..add(FetchMaritalStatus()),
          ),
          BlocProvider(
            create: (_) => ReligionBloc(MemberDropRepositoryImpl())
              ..add(FetchReligion()),
          ),
          BlocProvider(
            create: (_) => CasteBloc(MemberDropRepositoryImpl())
              ..add(FetchCastes()),
          ),

          // Education BLoCs
          BlocProvider(
            create: (_) => QualificationBloc(MemberDropRepositoryImpl())
              ..add(FetchQualifications()),
          ),
          BlocProvider(
            create: (_) => EducationBloc(MemberDropRepositoryImpl())
              ..add(FetchEducation()),
          ),

          // Employment BLoCs
          BlocProvider(
            create: (_) => EmploymentStatusBloc(MemberDropRepositoryImpl())
              ..add(FetchEmploymentStatus()),
          ),
          BlocProvider(
            create: (_) => JobBloc(MemberDropRepositoryImpl())
              ..add(FetchJobs()),
          ),
          BlocProvider(
            create: (_) => SkillsBloc(MemberDropRepositoryImpl())
              ..add(FetchSkills()),
          ),
          BlocProvider(
            create: (_) => EmploymentSupportBloc(MemberDropRepositoryImpl())
              ..add(FetchEmploymentSupports()),
          ),
          BlocProvider(
            create: (_) => FarmingTypeBloc(MemberDropRepositoryImpl())
              ..add(FetchFarmingTypes()),
          ),

          // Health BLoCs
          BlocProvider(
            create: (_) => HealthIssueBloc(MemberDropRepositoryImpl())
              ..add(FetchHealthIssues()),
          ),
          BlocProvider(
            create: (_) => HealthInsuranceBloc(MemberDropRepositoryImpl())
              ..add(FetchHealthInsurance()),
          ),
          BlocProvider(
            create: (_) => RequiredHealthSupportBloc(MemberDropRepositoryImpl())
              ..add(FetchRequiredHealthSupports()),
          ),

          // Pension/Welfare BLoCs
          BlocProvider(
            create: (_) => PensionTypeBloc(MemberDropRepositoryImpl())
              ..add(FetchPensionTypes()),
          ),
          BlocProvider(
            create: (_) => PensionRequiredBloc(MemberDropRepositoryImpl())
              ..add(FetchPensionRequirement()),
          ),
        ],
        child: DetailLoadGate(
          mode: mode,
          position: widget.position,
          editId: widget.editId,
        ),
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Icon and Name
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColor.lightBlue,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/contact.png',
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
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          widget.houseNumber,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '|',
                          style: TextStyle(fontSize: 13, color: AppColor.black),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            widget.houseName,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: AppColor.black,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.phone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColor.hintText2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '|',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColor.textLabel2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          'assets/icons/whatsapp_icon.png', // You'll need to add WhatsApp icon
                          width: 16,
                          height: 16,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.chat,
                              size: 16,
                              color: Colors.green,
                            );
                          },
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.whatsapp,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColor.hintText2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Divider(thickness: 1, color: AppColor.grey1),

          const SizedBox(height: 7),
          // Ward Info
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
              Expanded(
                child: Text(
                  widget.ward,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.hintText2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Age
          Row(
            children: [
              Image.asset(
                'assets/icons/age_icon.png',
                width: 12,
                height: 12,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  //print('Error loading image: $error');
                  return const Icon(
                    Icons.bar_chart,
                    size: 12,
                    color: AppColor.primary,
                  );
                },
              ),
              const SizedBox(width: 6),
              Text(
                widget.age,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.hintText2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          // Last Updated
          Row(
            children: [
              Icon(Icons.update, size: 16, color: AppColor.iconColor),
              const SizedBox(width: 6),
              Text(
                widget.lastUpdated,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.hintText2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton.icon(
                onPressed: () => onViewTap(context,PageMode.view),
                // onPressed: () {
                //   //add contition
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => AddFamilyMembers()),
                //   );
                // },
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
                  minimumSize: const Size(57, 23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // padding: const EdgeInsets.only(top: 4,bottom: 4),
                ),
              ),
              const SizedBox(width: 7),
              OutlinedButton.icon(
                //add contition
                onPressed: () {
                   onViewTap(context,PageMode.edit);
                },
                icon: const Icon(Icons.edit, size: 14, color: AppColor.button),
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
                  minimumSize: const Size(57, 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // padding: const EdgeInsets.only(top: 4,bottom: 4),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

}