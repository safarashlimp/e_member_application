import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_dowm_multiple_selector.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';

class EditFamilyJobDetails extends StatefulWidget {
  final PageMode mode;
  const EditFamilyJobDetails({super.key, required this.mode});

  @override
  State<EditFamilyJobDetails> createState() => _EditFamilyJobDetailsState();
}

class _EditFamilyJobDetailsState extends State<EditFamilyJobDetails> {
  final TextEditingController specifySkillLabel = TextEditingController();
    final TextEditingController surveyorNameLabel = TextEditingController();
  String? skillsLabel;
  String? employmentSupportLabel;
  String? employmentStatus;
  String? jobStatus;
  int norkaRegisteredLabel = 0;
  bool get isEdit => widget.mode == PageMode.edit;
  List<String> selectedSkills = [];
  String? farmingType;
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
          children: [
             GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ',onPress: () {
              Navigator.pop(context);
            },),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(13),
                physics: const BouncingScrollPhysics(),
                children: [
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
                              employmentSupportLabel = value;
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
                      ],
                    ),
                  ),

                  SizedBox(height: 50),
                  if(isEdit)
                  AppActionButton(
                    label: "സമർപ്പിക്കുക",
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType.employment,)),
                      // );
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
