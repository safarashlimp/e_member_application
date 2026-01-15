import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/core/widget/text_field/date_select_field.dart';
import 'package:e_member_app/core/widget/text_field/radio_field.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/caste/caste_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/gender_bloc/gender_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/gender_bloc/gender_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/marital_status/maritalstatus_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_state.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberBasicDetails extends StatefulWidget {
    final PageMode mode;
    final PersonalDetailsModel data;
  const EditFamilyMemberBasicDetails({super.key,
   required this.mode,
   required this.data
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
  final TextEditingController selectedDate = TextEditingController();
  final TextEditingController whatsupNumber = TextEditingController();
  final TextEditingController surveyorNameLabel = TextEditingController();
  String? selectedBloodGroup;
    String? selectedBloodGroupId;
  String? selectedReletion;
    String? selectedRelationId;
  String ?selectedGender ;
    String? selectedGenderId;
  String? selectedRlgn = 'hindu';
  String? selectedMaritalStatus;
    String? selectedMaritalStatusId;
  String? selectedCaste;
    String? selectedCasteId;

bool get isEdit => widget.mode == PageMode.edit;
   bool get isView => widget.mode == PageMode.view;

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
            GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ',onPress: (){
              Navigator.pop(context);
            },),
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
                                    child: CircularProgressIndicator(),
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
                                validator: Validator.validateDate,
                                controller:selectedDate,
focusedBorderColor: AppColor.borderColor,
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
                      //   MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType. personal, )),
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
