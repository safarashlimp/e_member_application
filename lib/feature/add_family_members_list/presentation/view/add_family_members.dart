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
import 'package:e_member_app/core/widget/text_field/radio_field.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/emloyment/employment_status_dart_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/emloyment/employment_status_dart_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/caste/caste_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/caste/caste_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/education/education_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/job/job_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/marital_status/maritalstatus_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/marital_status/maritalstatus_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/qualification/qualification_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/qualification/qualification_state.dart';

import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/relation_drop/relation_drop_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/relation_drop/relation_drop_state.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFamilyMembers extends StatefulWidget {
  const AddFamilyMembers({super.key});

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
  List<String> selectedSkills = [];
  // kudumbanadhanum aayula badham
String? selectedReletion;
String? selectedRelationId;
//  marital status
String? selectedMaritalStatus;
String? selectedMaritalStatusId;
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


  String selectedGender = 'male';
  String? selectedRlgn = 'hindu';

  String? selectedBloodGroup;


  String? hasHealthIssues;
  String? healthInsurance;
  String? selectedPensionType;
  String? skillsLabel;
  String? employmentSupportLabel;
 
  String? farmingType;
  String? requiredHealthSupports;
  String hasDisability = 'yes';
  String disabilityBenefit = "yes";
  String healthInsuranceCard = 'yes';
  String isIncludedInRationCard = 'yes';
  String isPensionReceiving = 'yes';
  String norkaRegisteredLabel = 'yes';
  String? isPensionRequired; // yes / no

  String student = 'yes';
  String patient = "yes";
  String needEducationHelp = 'yes';
  final List<String> skills = [
    'റോയിര രഴിവുകൾ',
    'പാചക രഴിവ്',
    'ലംബിംഗ്',
    'മൊബൈൽ റിപ്പയർ',
    'അഭിനയം',
    'നൃത്തം',
    'ഗാനാലാപനം',
    'ചിത്രരചന',
    'കമ്പ്യൂട്ടർ പരിജ്ഞാനം',
    'മത്സ്യബന്ധനം',
    'പാക്കിംഗ്',
    'തയ്യൽ',
    'കാർഷിക പ്രവർത്തനങ്ങൾ',
    'പ്രഭാഷണ രഴിവ്',
    'അധ്യാപന രഴിവ്',
    'മറ്റ്',
  ];
  @override
  void initState() {
    super.initState();

    mobileNumber.addListener(() {
      // copy text only if whatsapp field is empty OR same
      if (whatsupNumber.text != mobileNumber.text) {
        whatsupNumber.text = mobileNumber.text;

        // keep cursor at end
        whatsupNumber.selection = TextSelection.fromPosition(
          TextPosition(offset: whatsupNumber.text.length),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: BlocBuilder<RelationDropBloc, RelationDropState>(
          builder: (context, state) {
  if (state is RelationDropLoading ||
        state is RelationDropInitial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
                const GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ'),
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
                            AppDropdownField<String>(
                              label: 'രക്തഗ്രൂപ്പ്',
                              selectedValue: selectedBloodGroup,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'പക്കാ വീട്',
                                'സെമി പക്കാ വീട്',
                                'കച്ച വീട്',
                                'വാടക വീട്',
                                'വീട് ഇല്ല',
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            SizedBox(height: 20),
                           BlocBuilder<RelationDropBloc, RelationDropState>(
  builder: (context, state) {
    if (state is RelationDropLoading) {
      return const Center(child: CircularProgressIndicator());
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
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            selectedReletion = value;

           
            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            selectedRelationId = selectedItem.id;
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
                            AppRadioButtonField(
                              label: "ലിംഗം",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 7,
                              ),

                              value: selectedGender,
                              options: const [
                                {'label': 'പുരുഷൻ', 'value': 'male'},
                                {'label': 'സ്ത്രീ', 'value': 'female'},
                                {'label': 'മറ്റ്', 'value': 'other'},
                              ],
                              onChanged: (v) {
                                setState(() {
                                  selectedGender = v;
                                });
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
                                    validator: Validator.validateDate,
                                    controller: TextEditingController(),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: BlocBuilder<MaritalStatusBloc, MaritalStatusState>(
  builder: (context, state) {
    if (state is MaritalStatusLoading) {
      return const Center(child: CircularProgressIndicator());
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
        validator: Validator.validateSelection,

        // ✅ API DATA
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            selectedMaritalStatus = value;

            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            selectedMaritalStatusId = selectedItem.id;
          });
        },
      );
    }

    if (state is MaritalStatusError) {
      return Text(
        state.message,
        style: const TextStyle(color: Colors.red),
      );
    }

    return const SizedBox();
  },
),

                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            AppRadioButtonField(
                              label: "മതം",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 7,
                              ),

                              value: selectedRlgn,
                              options: const [
                                {'label': 'ഹിന്ദു', 'value': 'hindu'},
                                {'label': 'മുസ്ലിം', 'value': 'muslim'},
                                {'label': 'ക്രിസ്ത്യൻ', 'value': 'cris'},
                                {'label': 'സിഖ്', 'value': 'sikh'},
                                {'label': 'ബുദ്ധ', 'value': 'budha'},
                                {'label': 'ജൈന', 'value': 'jaina'},
                                {'label': 'മറ്റ്', 'value': 'other'},
                              ],
                              onChanged: (v) {
                                setState(() {
                                  selectedRlgn = v;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                           BlocBuilder<CasteBloc, CasteState>(
  builder: (context, state) {
    if (state is CasteLoading) {
      return const Center(child: CircularProgressIndicator());
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
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            selectedCaste = value;

            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            selectedCasteId = selectedItem.id;
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
      return const Center(child: CircularProgressIndicator());
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
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            selectedQualification = value;

            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            selectedQualificationId = selectedItem.id;
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
                                  if (v == 'no') {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (student == 'yes') ...[
                              const SizedBox(height: 20),
BlocBuilder<EducationBloc, EducationState>(
  builder: (context, state) {
    if (state is EducationLoading) {
      return const Center(child: CircularProgressIndicator());
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
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            selectedEducation = value;

            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            selectedEducationId = selectedItem.id;
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
                                    if (v == 'no') {
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
                            BlocBuilder<EmploymentStatusBloc, EmploymentStatusState>(
  builder: (context, state) {
    if (state is EmploymentStatusLoading) {
      return const Center(child: CircularProgressIndicator());
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
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            employmentStatus = value;

            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            employmentStatusId = selectedItem.id;
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
      return const Center(child: CircularProgressIndicator());
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
        items: state.items.map((e) => e.name).toList(),

        onChanged: (value) {
          setState(() {
            jobStatus = value;

            final selectedItem =
                state.items.firstWhere((e) => e.name == value);
            jobStatusId = selectedItem.id;
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
                            AppMultiSelectDropdown<String>(
                              label: 'കഴിവുകൾ / വൈദഗ്ധ്യങ്ങൾ',
                              items: skills,
                              selectedValues: selectedSkills,
                              //hintText: 'Select skills',
                              onChanged: (values) {
                                setState(() {
                                  selectedSkills = values;
                                });
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
                            AppDropdownField<String>(
                              label: 'തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ?',
                              selectedValue: employmentSupportLabel,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'പക്കാ വീട്',
                                'സെമി പക്കാ വീട്',
                                'കച്ച വീട്',
                                'വാടക വീട്',
                                'വീട് ഇല്ല',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  hasHealthIssues = value;
                                });
                              },
                            ),

                            if (employmentStatus == "പ്രവാസി") ...[
                              const SizedBox(height: 20),
                              AppRadioField(
                                label: "  നോർക്കയിൽ രജിസ്റ്റർ ചെയ്തിട്ടുണ്ടോ?",
                                value: norkaRegisteredLabel,
                                onChanged: (v) {
                                  setState(() {
                                    norkaRegisteredLabel = v;
                                    if (v == 'no') {
                                      // student = null; // reset dropdown
                                    }
                                  });
                                },
                                // onChanged: (v) => setState(() => student = v),
                              ),
                            ],
                            if (jobStatus == "കർഷകൻ") ...[
                              const SizedBox(height: 20),
                              AppDropdownField<String>(
                                label: 'ഏത് തരം കൃഷി ചെയ്യുന്നത് ?',
                                selectedValue: farmingType,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  "നെൽകൃഷി",
                                  "പച്ചക്കറി കൃഷി",
                                  "തോട്ടം കൃഷി",
                                  "മൃഗസംരക്ഷണം",
                                  "മത്സ്യകൃഷി",
                                  "മിശ്ര കൃഷി",
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    farmingType = value;
                                  });
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
                                  if (v == 'no') {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (patient == 'yes') ...[
                              const SizedBox(height: 20),
                              AppDropdownField<String>(
                                label: 'ആരോഗ്യ പ്രശ്നങ്ങൾ',
                                selectedValue: hasHealthIssues,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  'പക്കാ വീട്',
                                  'സെമി പക്കാ വീട്',
                                  'കച്ച വീട്',
                                  'വാടക വീട്',
                                  'വീട് ഇല്ല',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    hasHealthIssues = value;
                                  });
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
                                  if (v == 'no') {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (hasDisability == 'yes') ...[
                              const SizedBox(height: 20),
                              AppRadioField(
                                label: " ഭിന്നശേഷി ആനുകൂല്യം ലഭിക്കുന്നുണ്ടോ?",
                                value: disabilityBenefit,
                                onChanged: (v) {
                                  setState(() {
                                    disabilityBenefit = v;
                                    if (v == 'no') {
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
                                  if (v == 'no') {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (healthInsuranceCard == 'yes') ...[
                              const SizedBox(height: 20),
                              AppDropdownField<String>(
                                label: 'ഹെൽത്ത് ഇൻഷൂറൻസ്',
                                selectedValue: healthInsurance,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  'പക്കാ വീട്',
                                  'സെമി പക്കാ വീട്',
                                  'കച്ച വീട്',
                                  'വാടക വീട്',
                                  'വീട് ഇല്ല',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    healthInsurance = value;
                                  });
                                },
                              ),
                            ],
                            const SizedBox(height: 20),
                            AppDropdownField<String>(
                              label: 'ആവശ്യമായ ആരോഗ്യ സഹായങ്ങൾ',
                              selectedValue: requiredHealthSupports,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'പക്കാ വീട്',
                                'സെമി പക്കാ വീട്',
                                'കച്ച വീട്',
                                'വാടക വീട്',
                                'വീട് ഇല്ല',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  requiredHealthSupports = value;
                                });
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
                                  if (v == 'no') {
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
                                  if (v == 'no') {
                                    // student = null; // reset dropdown
                                  }
                                });
                              },
                              // onChanged: (v) => setState(() => student = v),
                            ),
                            if (isPensionReceiving == 'yes') ...[
                              const SizedBox(height: 20),
                              AppDropdownField<String>(
                                label: 'പെൻഷൻ തരം',
                                selectedValue: selectedPensionType,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  'പക്കാ വീട്',
                                  'സെമി പക്കാ വീട്',
                                  'കച്ച വീട്',
                                  'വാടക വീട്',
                                  'വീട് ഇല്ല',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedPensionType = value;
                                  });
                                },
                              ),
                            ],
                            SizedBox(height: 20),
                            AppDropdownField<String>(
                              label: 'പെൻഷൻ ആവശ്യമുണ്ടോ?',
                              selectedValue: isPensionRequired,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'പക്കാ വീട്',
                                'സെമി പക്കാ വീട്',
                                'കച്ച വീട്',
                                'വാടക വീട്',
                                'വീട് ഇല്ല',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  isPensionRequired = value;
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListFamily(),
                            ),
                          );
                        },
                        labelStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        height: 44,
                        icon: Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
