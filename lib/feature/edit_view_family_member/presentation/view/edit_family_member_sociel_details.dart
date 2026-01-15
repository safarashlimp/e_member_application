import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';

class EditFamilyMemberSocielDetails extends StatefulWidget {
  final PageMode mode;
  final WelfareResponse  data;
  const EditFamilyMemberSocielDetails({super.key, required this.mode, required this.data});

  @override
  State<EditFamilyMemberSocielDetails> createState() =>
      _EditFamilyMemberSocielDetailsState();
}

class _EditFamilyMemberSocielDetailsState
    extends State<EditFamilyMemberSocielDetails> {
  final TextEditingController surveyorNameLabel = TextEditingController();
  int isIncludedInRationCard = 0;
  int isPensionReceiving = 0;
  String? selectedPensionType;
bool get isEdit => widget.mode == PageMode.edit;
   bool get isView => widget.mode == PageMode.view;
  String? isPensionRequired; 
  String? selectedProvertyPrgm;// yes / no
  
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
                        SizedBox(height: 20,),
                        AppDropdownField<String>(
                                label: 'താങ്കൾ ദരിദ്ര നിർമാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ?',
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
                  if(isEdit)
                  AppActionButton(
                    label: "സമർപ്പിക്കുക",
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType.welfare,)),
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
