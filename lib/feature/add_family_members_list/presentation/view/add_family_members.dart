import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_dowm_multiple_selector.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/core/widget/text_field/date_select_field.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/detail_save_repo/detail_save_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/education/education_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/farming%20type/farming_bloc_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/farming%20type/farming_bloc_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/gender_bloc/gender_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/gender_bloc/gender_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health%20issue/health_issue_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health%20issue/health_issue_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health_insurance/health_insurance_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/jobs/job_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_state.dart';

import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFamilyMembers extends StatefulWidget {
  final String editId;
  const AddFamilyMembers({super.key, required this.editId});

  @override
  State<AddFamilyMembers> createState() => _AddFamilyMembersState();
}

class _AddFamilyMembersState extends State<AddFamilyMembers> {
  final TextEditingController specifySkillLabel = TextEditingController();
  final TextEditingController familyMemberName = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController whatsupNumber = TextEditingController();
  final TextEditingController treatmentPlaceLabel = TextEditingController();
  final TextEditingController surveyorNameLabel = TextEditingController();
  final TextEditingController courseStudy = TextEditingController();
  final TextEditingController studyCenter = TextEditingController();
  final TextEditingController selectedDate = TextEditingController();

    bool _isAnyBlocLoading(BuildContext context) {
    final relationState = context.watch<RelationDropBloc>().state;
    final bloodGroupState = context.watch<BloodGroupBloc>().state;
    final genderState = context.watch<GenderBloc>().state;
    final maritalState = context.watch<MaritalStatusBloc>().state;
    final religionState = context.watch<ReligionBloc>().state;
    final casteState = context.watch<CasteBloc>().state;
    final qualificationState = context.watch<QualificationBloc>().state;
    final educationState = context.watch<EducationBloc>().state;
    final employmentState = context.watch<EmploymentStatusBloc>().state;
    final jobState = context.watch<JobBloc>().state;
    final skillsState = context.watch<SkillsBloc>().state;
    final empSupportState = context.watch<EmploymentSupportBloc>().state;
    final farmingState = context.watch<FarmingTypeBloc>().state;
    final healthIssueState = context.watch<HealthIssueBloc>().state;
    final healthInsState = context.watch<HealthInsuranceBloc>().state;
    final reqHealthState = context.watch<RequiredHealthSupportBloc>().state;
    final pensionTypeState = context.watch<PensionTypeBloc>().state;
    final pensionReqState = context.watch<PensionRequiredBloc>().state;

    return relationState is RelationDropLoading ||
        relationState is RelationDropInitial ||
        bloodGroupState is BloodGroupLoading ||
        genderState is GenderLoading ||
        maritalState is MaritalStatusLoading ||
        religionState is ReligionLoading ||
        casteState is CasteLoading ||
        qualificationState is QualificationLoading ||
        educationState is EducationLoading ||
        employmentState is EmploymentStatusLoading ||
        jobState is JobLoading ||
        skillsState is SkillsLoading ||
        empSupportState is EmploymentSupportLoading ||
        farmingState is FarmingTypeLoading ||
        healthIssueState is HealthIssueLoading ||
        healthInsState is HealthInsuranceLoading ||
        reqHealthState is RequiredHealthSupportLoading ||
        pensionTypeState is PensionTypeLoading ||
        pensionReqState is PensionRequiredLoading;
  }


  // kudumbanadhanum aayula badham
  String? selectedReletion;
  String? selectedRelationId;
  //  marital status
  String? selectedMaritalStatus;
  String? selectedMaritalStatusId;
bool isWhatsAppManuallyEdited = false; 
  // gender
  String? selectedGender;
  String? selectedGenderId;
  // Religion
  String? selectedReligion;
  String? selectedReligionId;
  // caste
  String? selectedCaste;
  String? selectedCasteId;

  // qualification
  String? selectedQualification;
  String? selectedQualificationId;
  // education
  String? selectedEducation;
  String? selectedEducationId;
  // employment status
  String? employmentStatus;
  String? employmentStatusId;

  // job
  String? jobStatus;
  String? jobStatusId;
  // employment support
  String? employmentSupportLabel;
  String? employmentSupportId;

  // farming type
  String? farmingType;
  String? farmingTypeId;
  DateTime? selectedDob;

  // blood
  String? selectedBloodGroup;
  String? selectedBloodGroupId;

  // health issue
  String? hasHealthIssues;
  String? hasHealthIssuesId;
  // health insurance
  String? healthInsurance;
  String? healthInsuranceId;

  // requried health product
  String? requiredHealthSupports;
  String? requiredHealthSupportsId;

  // pantion type
  String? selectedPensionType;
  String? selectedPensionTypeId;

  // pansion required
  String? isPensionRequired;
  String? isPensionRequiredId;

  // skill
    List<String> selectedSkills = [];
    List<String> selectedSkillIds = [];

  String? selectedRlgn = 'hindu';

  String? skillsLabel;

  int hasDisability = 0;
  int disabilityBenefit = 0;
  int healthInsuranceCard = 0;
  int isIncludedInRationCard = 0;
  int isPensionReceiving = 0;
  int norkaRegisteredLabel = 0;

  int student = 0;
  int patient = 0;
  int needEducationHelp = 0;
  String? selectedProvertyPrgm;

  final Map<String, int> povertyProgramMap = {
    'അല്ല': 0,
    'തൊഴിലുറപ്പ്': 1,
    'കുടുംബശ്രീ': 2,
    'ഹരിത കർമ്മസേന': 3,
  };

  @override
  void initState() {
    super.initState();

   
   mobileNumber.addListener(() {
    if (!isWhatsAppManuallyEdited) {
      whatsupNumber.text = mobileNumber.text;
      whatsupNumber.selection = TextSelection.fromPosition(
        TextPosition(offset: whatsupNumber.text.length),
      );
    }
  });

  // Track when user manually edits WhatsApp field
  whatsupNumber.addListener(() {
    // If user types in WhatsApp field directly, mark it as manually edited
    if (whatsupNumber.text != mobileNumber.text && whatsupNumber.text.isNotEmpty) {
      isWhatsAppManuallyEdited = true;
    }
    // If user clears WhatsApp, allow auto-fill again
    if (whatsupNumber.text.isEmpty) {
      isWhatsAppManuallyEdited = false;
    }
  });

  
}

 

  @override
  Widget build(BuildContext context) {
    final isLoading = _isAnyBlocLoading(context);

    return SafeArea(
      
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body:  isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
:
        
        
        
        BlocBuilder<RelationDropBloc, RelationDropState>(
          builder: (context, state) {
            

            if (state is RelationDropError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return Column(
              //mainAxisSize: .min,
              children: [
                GradientHeader(
                  title: 'സമ്പൂർണ്ണ സർവ്വേ',
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(13),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SurveySection(
                        title: "കുടുംബാംഗത്തിന്റെ വ്യക്തിഗത വിവരങ്ങൾ",
                        iconAsset: "assets/images/house.png",
                        child: Column(
                          children: [
                            AppTextField(
                              controller: familyMemberName,
                              label: "കുടുംബാംഗത്തിന്റെ പേര്",
                              labelColor: AppColor.hintText2,
                              borderColor: AppColor.borderColor,
                              focusedBorderColor: AppColor.primary,
                              labelfontSizes: 12,
                              textColor: AppColor.primary,
                              validator: Validator.validateName,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextField(
                                    controller: mobileNumber,
                                    label: "മൊബൈൽ നമ്പർ",
                                    labelColor: AppColor.hintText2,
                                    borderColor: AppColor.borderColor,
                                    focusedBorderColor: AppColor.primary,
                                    labelfontSizes: 12,
                                    textColor: AppColor.primary,
                                    validator: Validator.validateMobile,
                                    type: "mobile",
                                    width: double.infinity,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: AppTextField(
                                    controller: whatsupNumber,
                                    label: "വാട്സ്ആപ്പ് നമ്പർ",
                                    labelColor: AppColor.hintText2,
                                    borderColor: AppColor.borderColor,
                                    focusedBorderColor: AppColor.primary,
                                    labelfontSizes: 12,
                                    textColor: AppColor.primary,
                                    validator: Validator.validateMobile,
                                    type: "mobile",
                                    width: double.infinity,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<BloodGroupBloc, BloodGroupState>(
                              builder: (context, state) {
                                if (state is BloodGroupLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      
                                    ),
                                  );
                                }

                                if (state is BloodGroupLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'രക്തഗ്രൂപ്പ്',
                                    selectedValue: selectedBloodGroup,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        selectedBloodGroup = value;

                                        selectedBloodGroupId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is BloodGroupError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<RelationDropBloc, RelationDropState>(
                              builder: (context, state) {
                                if (state is RelationDropLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is RelationDropLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'കുടുംബനാഥനുമായുള്ള ബന്ധം',
                                    selectedValue: selectedReletion,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA HERE
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        selectedReletion = value;

                                        selectedRelationId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is RelationDropError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<GenderBloc, GenderState>(
                              builder: (context, state) {
                                if (state is GenderLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is GenderLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'ലിംഗം',
                                    selectedValue: selectedGender,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                        selectedGenderId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is GenderError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: AppDateField(
                                      context: context,
                                      label: 'ജനനത്തീയതി',
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      iconColor: AppColor.hintText2,
                                      textColor: AppColor.primary,
                                      focusedBorderColor: AppColor.borderColor,
                                      validator: Validator.validateDate,
                                      controller: selectedDate,
                                      onDateSelected: (DateTime date) {
                                        setState(() {
                                          selectedDob = date;
                                        });
                                      }
                                      //  selectedDob = date;
                                      ),
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: BlocBuilder<MaritalStatusBloc,
                                      MaritalStatusState>(
                                    builder: (context, state) {
                                      if (state is MaritalStatusLoading) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      if (state is MaritalStatusLoaded) {
                                        return AppDropdownField<String>(
                                          label: 'വിവാഹസ്ഥിതി',
                                          selectedValue: selectedMaritalStatus,
                                          borderColor: AppColor.borderColor,
                                          labelColor: AppColor.hintText2,
                                          selectedTextColor: AppColor.primary,
                                          iconColor: AppColor.black,
                                          dropdownBgColor: AppColor.white,
                                          dropdownTextColor: AppColor.hintText,
                                          validator:
                                              Validator.validateSelection,

                                          // ✅ API DATA
                                          items: state.items
                                              .map((e) => e.name)
                                              .toList(),

                                          onChanged: (value) {
                                            setState(() {
                                              selectedMaritalStatus = value;

                                              selectedMaritalStatusId = state
                                                  .items
                                                  .firstWhere(
                                                      (e) => e.name == value)
                                                  .id;
                                            });
                                          },
                                        );
                                      }

                                      if (state is MaritalStatusError) {
                                        return Text(
                                          state.message,
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        );
                                      }

                                      return const SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<ReligionBloc, ReligionState>(
                              builder: (context, state) {
                                if (state is ReligionLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is ReligionLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'മതം',
                                    selectedValue: selectedReligion,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        selectedReligion = value;

                                        selectedReligionId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is ReligionError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<CasteBloc, CasteState>(
                              builder: (context, state) {
                                if (state is CasteLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is CasteLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'ജാതി',
                                    selectedValue: selectedCaste,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        selectedCaste = value;

                                        selectedCasteId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is CasteError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      SurveySection(
                        title: "വിദ്യാഭ്യാസ വിവരം",
                        iconAsset: "assets/images/education.png",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<QualificationBloc, QualificationState>(
                              builder: (context, state) {
                                if (state is QualificationLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is QualificationLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'വിദ്യാഭ്യാസ യോഗ്യത',
                                    selectedValue: selectedQualification,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        selectedQualification = value;

                                        selectedQualificationId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is QualificationError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ?",
                              value: student,
                              onChanged: (v) {
                                setState(() {
                                  student = v;
                                  if (v == 0) {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (student == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<EducationBloc, EducationState>(
                                builder: (context, state) {
                                  if (state is EducationLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is EducationLoaded) {
                                    return AppDropdownField<String>(
                                      label: ' പഠനം',
                                      selectedValue: selectedEducation,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,

                                      // ✅ API DATA
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          selectedEducation = value;

                                          selectedEducationId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  if (state is EducationError) {
                                    return Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                              SizedBox(height: 20),
                              AppTextField(
                                controller: courseStudy,
                                label: "പഠിക്കുന്ന കോഴ്‌സ്",
                                labelColor: AppColor.hintText2,
                                borderColor: AppColor.borderColor,
                                focusedBorderColor: AppColor.primary,
                                labelfontSizes: 12,
                                textColor: AppColor.primary,
                                validator: Validator.validateName,
                                width: double.infinity,
                              ),
                              SizedBox(height: 20),
                              AppTextField(
                                controller: studyCenter,
                                label: "പഠിക്കുന്ന സ്ഥാപനം",
                                labelColor: AppColor.hintText2,
                                borderColor: AppColor.borderColor,
                                focusedBorderColor: AppColor.primary,
                                labelfontSizes: 12,
                                textColor: AppColor.primary,
                                validator: Validator.validateName,
                                width: double.infinity,
                              ),
                              SizedBox(height: 20),
                              AppRadioField(
                                label: "വിദ്യാഭ്യാസ സഹായം ആവശ്യമുണ്ടോ?",
                                value: needEducationHelp,
                                onChanged: (v) {
                                  setState(() {
                                    needEducationHelp = v;
                                    if (v == 0) {
                                      // student = null; // reset dropdown
                                    }
                                  });
                                },
                                // onChanged: (v) => setState(() => student = v),
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      SurveySection(
                        title: "തൊഴിൽ വിവരം",
                        iconAsset: "assets/images/job.png",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<EmploymentStatusBloc,
                                EmploymentStatusState>(
                              builder: (context, state) {
                                if (state is EmploymentStatusLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is EmploymentStatusLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'തൊഴിൽ നില',
                                    selectedValue: employmentStatus,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        employmentStatus = value;

                                        employmentStatusId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is EmploymentStatusError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<JobBloc, JobState>(
                              builder: (context, state) {
                                if (state is JobLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is JobLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'തൊഴിൽ',
                                    selectedValue: jobStatus,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        jobStatus = value;

                                        jobStatusId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is JobError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<SkillsBloc, SkillsState>(
                              builder: (context, state) {
                                if (state is SkillsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is SkillsLoaded) {
                                  return AppMultiSelectDropdown<String>(
                                    label: 'കഴിവുകൾ / വൈദഗ്ധ്യങ്ങൾ',

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    selectedValues: selectedSkills,

                                    onChanged: (values) {
                                      setState(() {
                                        selectedSkills = values;

                                        // store selected IDs also
                                        selectedSkillIds = state.items
                                            .where(
                                              (e) => values.contains(e.name),
                                            )
                                            .map((e) => e.id)
                                            .toList();
                                      });
                                    },
                                  );
                                }

                                if (state is SkillsError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            AppTextField(
                              controller: specifySkillLabel,
                              label: "കഴിവ് വ്യക്തമാക്കുക",
                              labelColor: AppColor.hintText2,
                              borderColor: AppColor.borderColor,
                              focusedBorderColor: AppColor.primary,
                              labelfontSizes: 12,
                              textColor: AppColor.primary,
                              validator: Validator.validateName,
                              width: double.infinity,
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<EmploymentSupportBloc,
                                EmploymentSupportState>(
                              builder: (context, state) {
                                if (state is EmploymentSupportLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is EmploymentSupportLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ?',
                                    selectedValue: employmentSupportLabel,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        employmentSupportLabel = value;

                                        employmentSupportId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is EmploymentSupportError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            if (employmentStatus == "വിദേശത്ത്") ...[
                              const SizedBox(height: 20),
                              AppRadioField(
                                label: "  നോർക്കയിൽ രജിസ്റ്റർ ചെയ്തിട്ടുണ്ടോ?",
                                value: norkaRegisteredLabel,
                                onChanged: (v) {
                                  setState(() {
                                    norkaRegisteredLabel = v;
                                    if (v == 0) {
                                      // student = null; // reset dropdown
                                    }
                                  });
                                },
                                // onChanged: (v) => setState(() => student = v),
                              ),
                            ],
                            if (jobStatus == "കർഷകൻ") ...[
                              const SizedBox(height: 20),
                              BlocBuilder<FarmingTypeBloc, FarmingTypeState>(
                                builder: (context, state) {
                                  if (state is FarmingTypeLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is FarmingTypeLoaded) {
                                    return AppDropdownField<String>(
                                      label: 'ഏത് തരം കൃഷി ചെയ്യുന്നത് ?',
                                      selectedValue: farmingType,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,

                                      // ✅ API DATA
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          farmingType = value;

                                          farmingTypeId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  if (state is FarmingTypeError) {
                                    return Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      SurveySection(
                        title: "ആരോഗ്യ വിവരം",
                        iconAsset: "assets/images/health.png",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppRadioField(
                              label: " രോഗിയാണോ ?",
                              value: patient,
                              onChanged: (v) {
                                setState(() {
                                  patient = v;
                                  if (v == 0) {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (patient == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<HealthIssueBloc, HealthIssueState>(
                                builder: (context, state) {
                                  if (state is HealthIssueLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is HealthIssueLoaded) {
                                    return AppDropdownField<String>(
                                      label: 'ആരോഗ്യ പ്രശ്നങ്ങൾ',
                                      selectedValue: hasHealthIssues,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,

                                      // ✅ API DATA
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          hasHealthIssues = value;

                                          hasHealthIssuesId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  if (state is HealthIssueError) {
                                    return Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                              SizedBox(height: 20),
                              AppTextField(
                                controller: treatmentPlaceLabel,
                                label: "ചികിത്സ നടത്തുന്ന സ്ഥലം",
                                labelColor: AppColor.hintText2,
                                borderColor: AppColor.borderColor,
                                focusedBorderColor: AppColor.primary,
                                labelfontSizes: 12,
                                textColor: AppColor.primary,
                                validator: Validator.validateName,
                                width: double.infinity,
                              ),
                            ],
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " ഭിന്നശേഷിയുണ്ടോ?",
                              value: hasDisability,
                              onChanged: (v) {
                                setState(() {
                                  hasDisability = v;
                                  if (v == 0) {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (hasDisability == 1) ...[
                              const SizedBox(height: 20),
                              AppRadioField(
                                label: " ഭിന്നശേഷി ആനുകൂല്യം ലഭിക്കുന്നുണ്ടോ?",
                                value: disabilityBenefit,
                                onChanged: (v) {
                                  setState(() {
                                    disabilityBenefit = v;
                                    if (v == 0) {
                                      // student = null; // reset dropdown
                                    }
                                  });
                                },
                                // onChanged: (v) => setState(() => student = v),
                              ),
                            ],
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " ഹെൽത്ത് ഇൻഷൂറൻസ് കാർഡ് ഉണ്ടോ?",
                              value: healthInsuranceCard,
                              onChanged: (v) {
                                setState(() {
                                  healthInsuranceCard = v;
                                  if (v == 0) {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (healthInsuranceCard == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<HealthInsuranceBloc,
                                  HealthInsuranceState>(
                                builder: (context, state) {
                                  if (state is HealthInsuranceLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is HealthInsuranceLoaded) {
                                    return AppDropdownField<String>(
                                      label: 'ഹെൽത്ത് ഇൻഷൂറൻസ്',
                                      selectedValue: healthInsurance,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,

                                      // ✅ API DATA
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          healthInsurance = value;
                                          healthInsuranceId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  if (state is HealthInsuranceError) {
                                    return Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                            ],
                            const SizedBox(height: 20),
                            BlocBuilder<RequiredHealthSupportBloc,
                                RequiredHealthSupportState>(
                              builder: (context, state) {
                                if (state is RequiredHealthSupportLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is RequiredHealthSupportLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'ആവശ്യമായ ആരോഗ്യ സഹായങ്ങൾ',
                                    selectedValue: requiredHealthSupports,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        requiredHealthSupports = value;

                                        requiredHealthSupportsId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is RequiredHealthSupportError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      SurveySection(
                        title: "സാമൂഹിക  /  ക്ഷേമ വിവരങ്ങൾ",
                        iconAsset: "assets/images/social.png",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppRadioField(
                              label: " റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ?",
                              value: isIncludedInRationCard,
                              onChanged: (v) {
                                setState(() {
                                  isIncludedInRationCard = v;
                                  if (v == 0) {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " പെൻഷൻ ലഭിക്കുന്നുണ്ടോ?",
                              value: isPensionReceiving,
                              onChanged: (v) {
                                setState(() {
                                  isPensionReceiving = v;
                                  if (v == 0) {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (isPensionReceiving == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<PensionTypeBloc, PensionTypeState>(
                                builder: (context, state) {
                                  if (state is PensionTypeLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is PensionTypeLoaded) {
                                    return AppDropdownField<String>(
                                      label: 'പെൻഷൻ തരം',
                                      selectedValue: selectedPensionType,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,

                                      // ✅ API DATA
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          selectedPensionType = value;

                                          selectedPensionTypeId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  if (state is PensionTypeError) {
                                    return Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                            ],
                            SizedBox(height: 20),
                            BlocBuilder<PensionRequiredBloc,
                                PensionRequiredState>(
                              builder: (context, state) {
                                if (state is PensionRequiredLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is PensionRequiredLoaded) {
                                  return AppDropdownField<String>(
                                    label: 'പെൻഷൻ ആവശ്യമുണ്ടോ?',
                                    selectedValue: isPensionRequired,
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    selectedTextColor: AppColor.primary,
                                    iconColor: AppColor.black,
                                    dropdownBgColor: AppColor.white,
                                    dropdownTextColor: AppColor.hintText,
                                    validator: Validator.validateSelection,

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        isPensionRequired = value;

                                        isPensionRequiredId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }

                                if (state is PensionRequiredError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            AppDropdownField<String>(
                              label:
                                  'താങ്കൾ ദരിദ്ര നിർമാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ?',
                              selectedValue: selectedProvertyPrgm,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                ' അല്ല',
                                'തൊഴിലുറപ്പ്',
                                'കുടുംബശ്രീ',
                                'ഹരിത കർമ്മസേന',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedProvertyPrgm = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            AppTextField(
                              controller: surveyorNameLabel,
                              label: "സർവേ നടത്തിയ ആളുടെ പേര്",
                              labelColor: AppColor.hintText2,
                              borderColor: AppColor.borderColor,
                              focusedBorderColor: AppColor.primary,
                              labelfontSizes: 12,
                              textColor: AppColor.primary,
                              validator: Validator.validateName,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      AppActionButton(
                        label: "സമർപ്പിക്കുക",
                        onPressed: () async {
                          // 🔹 BASIC VALIDATION
                          if (familyMemberName.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("കുടുംബാംഗത്തിന്റെ പേര് നൽകുക")),
                            );
                            return;
                          }

                          if (selectedRelationId == null ||
                              selectedGenderId == null ||
                              selectedBloodGroupId == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "അനിവാര്യമായ വിവരങ്ങൾ തിരഞ്ഞെടുക്കുക")),
                            );
                            return;
                          }
                          final dobApi =
                              "${selectedDob!.year}-${selectedDob!.month.toString().padLeft(2, '0')}-${selectedDob!.day.toString().padLeft(2, '0')}";

                          try {
                            // 🔹 GET USER ID (ward_member + surveyor)
                            final prefs = await SharedPreferences.getInstance();
                            final userId =
                                int.parse(prefs.getString(PrefKeys.userId)!);

                           final whatsappValue = whatsupNumber.text.isNotEmpty
    ?  whatsupNumber.text // ✅ Uses WhatsApp if not empty
    : mobileNumber.text;   // ✅ Falls back to mobile if empty
print("🔍 Mobile: ${mobileNumber.text}");
print("🔍 WhatsApp: $whatsappValue");
print("🔍 WhatsApp Controller: ${whatsupNumber.text}");
                            await FamilyMemberSaveRepository().saveFamilyMember(
                              // 🔹 REQUIRED
                              householdId: widget.editId,
                              // 👈 editId from list

                              surveyor: surveyorNameLabel.text,
                              // 🔹 BASIC DETAILS
                              name: familyMemberName.text.trim(),
                               mobile: mobileNumber.text,
  whatsapp: whatsappValue,

                              bloodGroupId:
                                  int.parse(selectedBloodGroupId ?? '0'),
                              relationId: int.parse(selectedRelationId ?? '0'),
                              genderId: int.parse(selectedGenderId ?? '0'),
                              dob: dobApi,

                              maritalStatusId:
                                  int.parse(selectedMaritalStatusId ?? '0'),
                              religionId: int.parse(selectedReligionId ?? '0'),
                              casteId: int.parse(selectedCasteId ?? '0'),

                              // 🔹 EDUCATION
                              qualificationId:
                                  int.parse(selectedQualificationId ?? '0'),
                              currentlyStudying: student,
                              courseId: int.parse(selectedEducationId ?? '0'),
                              courseOther: courseStudy.text,
                              institution: studyCenter.text,
                              needEducationSupport: needEducationHelp,

                              // 🔹 EMPLOYMENT
                              employmentStatusId:
                                  int.parse(employmentStatusId ?? '0'),
                              occupationId: int.parse(jobStatusId ?? '0'),
                              skills: selectedSkillIds.join(','),
                              skillDetails: specifySkillLabel.text,
                              needJobSupportId:
                                  int.parse(employmentSupportId ?? '0'),

                              // 🔹 OTHER
                              norkaRegistered: norkaRegisteredLabel,
                              agricultureType: int.parse(farmingTypeId ?? '0'),
                              isPatient: patient,

                              // 🔹 HEALTH
                              diseases: (hasHealthIssuesId == '1'
                                      ? int.tryParse(
                                              requiredHealthSupports ?? '0') ??
                                          0
                                      : 0)
                                  .toString(),
                              treatmentPlace: treatmentPlaceLabel.text,
                              disabled: hasDisability,
                              disabilityBenefit: disabilityBenefit,
                              insuranceCard: healthInsuranceCard,
                              insuranceTypeId:
                                  int.parse(healthInsuranceId ?? '0'),
                              healthHelp:
                                  int.parse(requiredHealthSupportsId ?? '0'),

                              // 🔹 SOCIAL SECURITY
                              includedInRation: isIncludedInRationCard,
                              receivingPension: isPensionReceiving,
                              pensionTypeId:
                                  int.parse(selectedPensionTypeId ?? '0'),
                              needPensionTypeId:
                                  int.parse(isPensionRequiredId ?? '0'),
                              povertyPgm:
                                  povertyProgramMap[selectedProvertyPrgm] ?? 0,
                            );

                            // ✅ SUCCESS
                            Navigator.pop(context, true);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        labelStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}
