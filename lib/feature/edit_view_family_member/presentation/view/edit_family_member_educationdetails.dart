import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';

class EditFamilyMemberEducationdetails extends StatefulWidget {
   final PageMode mode;
  const EditFamilyMemberEducationdetails({super.key, required this.mode});
 bool get isEdit => mode == PageMode.edit;
  @override
  State<EditFamilyMemberEducationdetails> createState() => 
      _EditFamilyMemberEducationdetailsState();
}

class _EditFamilyMemberEducationdetailsState
    extends State<EditFamilyMemberEducationdetails> {
  final TextEditingController courseStudy = TextEditingController();
  final TextEditingController studyCenter = TextEditingController();
  final TextEditingController surveyorNameLabel= TextEditingController();
  String? selectedEducation;
  String? selectedQualification;

  int student = 0 ;
  int needEducationHelp = 0;
  bool get isEdit => widget.mode == PageMode.edit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
             GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ',onPress: (){
              Navigator.pop(context);
            },),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(13),
                physics: const BouncingScrollPhysics(),
                children: [
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
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        if (student == 1) ...[
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
                                if (v == 0) {
                                  // student = null; // reset dropdown
                                }
                              });
                            },
                            // onChanged: (v) => setState(() => student = v),
                          ),],
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
                  if(isEdit)
                  AppActionButton(
                    label: "സമർപ്പിക്കുക",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType.education,)),
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
