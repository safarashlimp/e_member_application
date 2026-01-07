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
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:flutter/material.dart';

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
  String? selectedReletion;
  String selectedGender = 'male';
  String? selectedRlgn = 'hindu';
  String? selectedMaritalStatus;
  String? selectedCaste;
  String? selectedEducation;
  String? selectedQualification;
  String? hasHealthIssues;
  String? healthInsurance;
  String? selectedPensionType;
  String? skillsLabel;
  String? employmentSupportLabel;
  String? employmentStatus;
  String? jobStatus;

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
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: Column(
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
                          label: 'കുടുംബനാഥനുമായുള്ള ബന്ധം',
                          selectedValue: selectedReletion,
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
                              selectedReletion = value;
                            });
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
                            Expanded(
                              child: AppDropdownField<String>(
                                label: 'വിവാഹസ്ഥിതി',
                                selectedValue: selectedMaritalStatus,
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
                                    selectedMaritalStatus = value;
                                  });
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
                        AppDropdownField<String>(
                          label: 'ജാതി',
                          selectedValue: selectedCaste,
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
                              selectedCaste = value;
                            });
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
                        AppDropdownField<String>(
                          label: 'വിദ്യാഭ്യാസ യോഗ്യത',
                          selectedValue: selectedQualification,
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
                              selectedQualification = value;
                            });
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

                          AppDropdownField<String>(
                            label: ' പഠനം',
                            selectedValue: selectedEducation,
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
                                selectedEducation = value;
                              });
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
                        AppDropdownField<String>(
                          label: 'തൊഴിൽ നില',
                          selectedValue: employmentStatus,
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
                            "പ്രവാസി",
                          ],
                          onChanged: (value) {
                            setState(() {
                              employmentStatus = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        AppDropdownField<String>(
                          label: 'തൊഴിൽ',
                          selectedValue: jobStatus,
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
                            "കർഷകൻ",
                            'വീട് ഇല്ല',
                          ],
                          onChanged: (value) {
                            setState(() {
                              jobStatus = value;
                            });
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
                        MaterialPageRoute(builder: (context) => ListFamily()),
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
        ),
      ),
    );
  }
}
