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
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_state.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_event.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberBasicDetails extends StatefulWidget {
  final PageMode mode;
  final PersonalDetailsModel data;
  final String? editId;
  final String position;
  const EditFamilyMemberBasicDetails({
    super.key,
    required this.mode,
    required this.data,
    this.editId,
    required this.position,
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
  String? selectedGender;
  String? selectedGenderId;
  String? selectedRlgn;
  String? selectedMaritalStatus;
  String? selectedMaritalStatusId;
  String? selectedCaste;
  String? selectedCasteId;
  String? selectedReligion;
  String? selectedReligionId;

  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;
  bool _isAnyEditFamilyBlocLoading(BuildContext context) {
  final bloodGroupState = context.watch<BloodGroupBloc>().state;
  final relationState = context.watch<RelationDropBloc>().state;
  final genderState = context.watch<GenderBloc>().state;
  final maritalState = context.watch<MaritalStatusBloc>().state;
  final religionState = context.watch<ReligionBloc>().state;
  final casteState = context.watch<CasteBloc>().state;
  final editSubmitState = context.watch<EditFamilyMemberBloc>().state;

  return bloodGroupState is BloodGroupLoading ||
      relationState is RelationDropLoading ||
      genderState is GenderLoading ||
      maritalState is MaritalStatusLoading ||
      religionState is ReligionLoading ||
      casteState is CasteLoading ||
      editSubmitState is EditFamilyMemberSubmitting;
}


  void _populateFields(PersonalDetailsModel value) {
    // Text fields
    familyMemberName.text = value.name ?? '';
    mobileNumber.text = value.mobile;
    whatsupNumber.text = value.whatsapp;
    selectedDate.text = value.dob;
    surveyorNameLabel.text = value.surveyor;

    selectedGenderId = value.genderId;

    selectedBloodGroupId = value.bloodgroup;

    selectedRelationId = value.relationId;

    selectedMaritalStatusId = value.maritalStatusId;

    selectedReligionId = value.religionId;

    selectedCasteId = value.casteId;
  }

  @override
  void initState() {
    super.initState();
    _populateFields(widget.data);

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
    final isLoading = _isAnyEditFamilyBlocLoading(context);

    return   isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
                backgroundColor:AppColor.white,
              ),
            )
:
    
    BlocBuilder<EditFamilyMemberBloc, EditFamilyMemberState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: AppColor.secondary,
            body:
             

            Column(
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
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is BloodGroupLoaded) {
                                  // 🔥 ADD THIS (same as ration card logic)
                                  if (selectedBloodGroupId != null &&
                                      selectedBloodGroup == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedBloodGroupId,
                                      orElse: () => state.items.first,
                                    );

                                    selectedBloodGroup = match.name;
                                  }

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
                                  // 🔥 ADD THIS (same as ration card logic)
                                  if (selectedRelationId != null &&
                                      selectedReletion == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedRelationId,
                                      orElse: () => state.items.first,
                                    );

                                    selectedReletion = match.name;
                                  }

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
                                  if (selectedGenderId != null &&
                                      selectedGender == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedGenderId,
                                      orElse: () => state.items.first,
                                    );

                                    selectedGender = match.name;
                                  }
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
                                    controller: selectedDate,
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
                                        if (selectedMaritalStatusId != null &&
                                            selectedMaritalStatus == null) {
                                          final match = state.items.firstWhere(
                                            (e) =>
                                                e.id == selectedMaritalStatusId,
                                            orElse: () => state.items.first,
                                          );

                                          selectedMaritalStatus = match.name;
                                        }
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
                                  if (selectedReligionId != null &&
                                      selectedReligion == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedReligionId,
                                      orElse: () => state.items.first,
                                    );

                                    selectedReligion = match.name;
                                  }
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
                                  if (selectedCasteId != null &&
                                      selectedCaste == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedCasteId,
                                      orElse: () => state.items.first,
                                    );

                                    selectedCaste = match.name;
                                  }
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
                      if (isEdit)
                        BlocListener<EditFamilyMemberBloc,
                            EditFamilyMemberState>(
                          listener: (context, state) {
                            if (state is EditFamilyMemberSubmitSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${state.screenName} updated successfully!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            } else if (state is EditFamilyMemberSubmitFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: ${state.message}'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: AppActionButton(
                            label: state is EditFamilyMemberSubmitting
                                ? "സമർപ്പിക്കുകയാണ്..."
                                : "സമർപ്പിക്കുക",
                            onPressed: () {
                              // ✅ Validate editId before submitting
                              final finalEditId = widget.editId ?? widget.data.id ?? '';
                              
                              if (finalEditId.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('❌ Error: Member ID is missing. Cannot update without ID.'),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                print('⚠️  WARNING: editId is empty! widget.editId=${widget.editId}, widget.data.id=${widget.data.id}');
                                return; // Don't proceed
                              }
                              

                              
                              final personalDetailsModel = PersonalDetailsModel(
                                id: finalEditId,
                                name: familyMemberName.text,
                                mobile: mobileNumber.text,
                                whatsapp: whatsupNumber.text,
                                bloodgroup: selectedBloodGroupId.toString(),
                                relationId: selectedRelationId.toString(),
                                genderId: selectedGenderId.toString(),
                                dob: selectedDate.text,
                                maritalStatusId:
                                    selectedMaritalStatusId.toString(),
                                religionId: selectedReligionId.toString(),
                                casteId: selectedCasteId.toString(),
                                surveyor: surveyorNameLabel.text,
                              );

                              context.read<EditFamilyMemberBloc>().add(
                                    SubmitPersonalDetailsEvent(
                                        data: personalDetailsModel,
                                        // Replace with actual clientId from your app
                                        editId: finalEditId
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
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
