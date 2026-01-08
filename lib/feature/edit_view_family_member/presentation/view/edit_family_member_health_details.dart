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

class EditFamilyHealthDetails extends StatefulWidget {
    final PageMode mode;
  const EditFamilyHealthDetails({super.key, required this.mode});

  @override
  State<EditFamilyHealthDetails> createState() =>
      _EditFamilyHealthDetailsState();
}

class _EditFamilyHealthDetailsState extends State<EditFamilyHealthDetails> {
  final TextEditingController treatmentPlaceLabel = TextEditingController();
  int patient = 0;
  String? hasHealthIssues;
  int hasDisability = 0;
  int disabilityBenefit = 0;
  int healthInsuranceCard = 0;
  String ? healthInsurance;
  String? requiredHealthSupports;
   bool get isEdit => widget.mode == PageMode.edit;
   bool get isView => widget.mode == PageMode.view;
   bool get isAdd => widget.mode == PageMode.add;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  if(isEdit)
                  AppActionButton(
                    label: "സമർപ്പിക്കുക",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType.health,), ),
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
