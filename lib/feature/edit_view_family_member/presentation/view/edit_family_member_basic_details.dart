import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/core/widget/text_field/date_select_field.dart';
import 'package:e_member_app/core/widget/text_field/radio_field.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';

class EditFamilyMemberBasicDetails extends StatefulWidget {
    final PageMode mode;
  const EditFamilyMemberBasicDetails({super.key,
   required this.mode,
  });

  @override
  State<EditFamilyMemberBasicDetails> createState() =>
      _EditFamilyMemberBasicDetailsState();
}

class _EditFamilyMemberBasicDetailsState
    extends State<EditFamilyMemberBasicDetails> {
  final TextEditingController specifySkillLabel = TextEditingController();
  final TextEditingController familyMemberName = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();

  final TextEditingController whatsupNumber = TextEditingController();
  String? selectedBloodGroup;
  String? selectedReletion;
  String selectedGender = 'male';
  String? selectedRlgn = 'hindu';
  String? selectedMaritalStatus;
  String? selectedCaste;

  bool get isEdit => widget.mode == PageMode.edit;

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
        body: Column(
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
                            setState(() {
                              selectedReletion = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
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
                            Flexible(
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
                  if(isEdit)
                  AppActionButton(
                    label: "സമർപ്പിക്കുക",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType. personal, )),
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
