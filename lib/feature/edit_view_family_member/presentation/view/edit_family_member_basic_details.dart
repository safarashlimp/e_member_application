import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/core/widget/text_field/date_select_field.dart';
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
  // ✅ Text controllers (UI layer only)
  late TextEditingController familyMemberName;
  late TextEditingController mobileNumber;
  late TextEditingController whatsupNumber;
  late TextEditingController selectedDate;
  late TextEditingController surveyorNameLabel;

  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    familyMemberName = TextEditingController();
    mobileNumber = TextEditingController();
    whatsupNumber = TextEditingController();
    selectedDate = TextEditingController();
    surveyorNameLabel = TextEditingController();

    // Initialize BLoC form state with existing data
    context.read<EditFamilyMemberBloc>().add(InitializeFormEvent(widget.data));
  }

  @override
  void dispose() {
    // ✅ Properly dispose controllers
    familyMemberName.dispose();
    mobileNumber.dispose();
    whatsupNumber.dispose();
    selectedDate.dispose();
    surveyorNameLabel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFamilyMemberBloc, EditFamilyMemberState>(
      builder: (context, state) {
        // ✅ Sync controllers with BLoC state
        if (state is EditFamilyMemberFormLoaded) {
          if (familyMemberName.text != state.name) {
            familyMemberName.text = state.name;
          }
          if (mobileNumber.text != state.mobile) {
            mobileNumber.text = state.mobile;
          }
          if (whatsupNumber.text != state.whatsapp) {
            whatsupNumber.text = state.whatsapp;
          }
          if (selectedDate.text != state.dob) {
            selectedDate.text = state.dob;
          }
          if (surveyorNameLabel.text != state.surveyor) {
            surveyorNameLabel.text = state.surveyor;
          }
        }

        // ✅ Show loading if form not initialized
        if (state is! EditFamilyMemberFormLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: AppColor.secondary,
            body: Column(
              children: [
                GradientHeader(
                  title: 'സമ്പൂർണ്ണ സർവ്വെ',
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
                            // ✅ Use controller for UI, sync to BLoC on form submit
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
                          builder: (context, bloodState) {
                            if (bloodState is BloodGroupLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (bloodState is BloodGroupLoaded) {
                              return AppDropdownField<String>(
                                label: 'രക്തഗ്രൂപ്പ്',
                                selectedValue: state.bloodGroupName,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: bloodState.items
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (value) {
                                  final selectedItem = bloodState.items
                                      .firstWhere((e) => e.name == value);
                                  context.read<EditFamilyMemberBloc>().add(
                                    UpdateBloodGroupEvent(
                                      bloodGroupId: selectedItem.id,
                                      bloodGroupName: selectedItem.name,
                                    ),
                                  );
                                },
                              );
                            }

                            if (bloodState is BloodGroupError) {
                              return Text(
                                bloodState.message,
                                style: const TextStyle(color: Colors.red),
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                        SizedBox(height: 20),
                        BlocBuilder<RelationDropBloc, RelationDropState>(
                          builder: (context, relationState) {
                            if (relationState is RelationDropLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (relationState is RelationDropLoaded) {
                              return AppDropdownField<String>(
                                label: 'കുടുംബനാഥനുമായുള്ള ബന്ധം',
                                selectedValue: state.relationName,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: relationState.items
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (value) {
                                  final selectedItem = relationState.items
                                      .firstWhere((e) => e.name == value);
                                  context.read<EditFamilyMemberBloc>().add(
                                    UpdateRelationEvent(
                                      relationId: selectedItem.id,
                                      relationName: selectedItem.name,
                                    ),
                                  );
                                },
                              );
                            }

                            if (relationState is RelationDropError) {
                              return Text(
                                relationState.message,
                                style: const TextStyle(color: Colors.red),
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                        SizedBox(height: 20),
                        BlocBuilder<GenderBloc, GenderState>(
                          builder: (context, genderState) {
                            if (genderState is GenderLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (genderState is GenderLoaded) {
                              return AppDropdownField<String>(
                                label: 'ലിംഗം',
                                selectedValue: state.genderName,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: genderState.items
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (value) {
                                  final selectedItem = genderState.items
                                      .firstWhere((e) => e.name == value);
                                  context.read<EditFamilyMemberBloc>().add(
                                    UpdateGenderEvent(
                                      genderId: selectedItem.id,
                                      genderName: selectedItem.name,
                                    ),
                                  );
                                },
                              );
                            }

                            if (genderState is GenderError) {
                              return Text(
                                genderState.message,
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
                                builder: (context, maritalState) {
                                  if (maritalState is MaritalStatusLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (maritalState is MaritalStatusLoaded) {
                                    return AppDropdownField<String>(
                                      label: 'വിവാഹസ്ഥിതി',
                                      selectedValue: state.maritalStatusName,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,
                                      items: maritalState.items
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (value) {
                                        final selectedItem = maritalState.items
                                            .firstWhere(
                                                (e) => e.name == value);
                                        context
                                            .read<EditFamilyMemberBloc>()
                                            .add(
                                          UpdateMaritalStatusEvent(
                                            statusId: selectedItem.id,
                                            statusName: selectedItem.name,
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  if (maritalState is MaritalStatusError) {
                                    return Text(
                                      maritalState.message,
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
                          builder: (context, religionState) {
                            if (religionState is ReligionLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (religionState is ReligionLoaded) {
                              return AppDropdownField<String>(
                                label: 'മതം',
                                selectedValue: state.religionName,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: religionState.items
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (value) {
                                  final selectedItem = religionState.items
                                      .firstWhere((e) => e.name == value);
                                  context.read<EditFamilyMemberBloc>().add(
                                    UpdateReligionEvent(
                                      religionId: selectedItem.id,
                                      religionName: selectedItem.name,
                                    ),
                                  );
                                },
                              );
                            }

                            if (religionState is ReligionError) {
                              return Text(
                                religionState.message,
                                style: const TextStyle(color: Colors.red),
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                        SizedBox(height: 20),
                        BlocBuilder<CasteBloc, CasteState>(
                          builder: (context, casteState) {
                            if (casteState is CasteLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (casteState is CasteLoaded) {
                              return AppDropdownField<String>(
                                label: 'ജാതി',
                                selectedValue: state.casteName,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: casteState.items
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (value) {
                                  final selectedItem = casteState.items
                                      .firstWhere((e) => e.name == value);
                                  context.read<EditFamilyMemberBloc>().add(
                                    UpdateCasteEvent(
                                      casteId: selectedItem.id,
                                      casteName: selectedItem.name,
                                    ),
                                  );
                                },
                              );
                            }

                            if (casteState is CasteError) {
                              return Text(
                                casteState.message,
                                style: const TextStyle(color: Colors.red),
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                        SizedBox(height: 20),
                        AppTextField(
                          controller: surveyorNameLabel,
                          label: "സർവെ നടത്തിയ ആളുടെ പേര്",
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
                    BlocListener<EditFamilyMemberBloc, EditFamilyMemberState>(
                      listener: (context, listenerState) {
                        if (listenerState
                            is EditFamilyMemberSubmitSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${listenerState.screenName} updated successfully!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context);
                        } else if (listenerState
                            is EditFamilyMemberSubmitFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Error: ${listenerState.message}'),
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
                          // ✅ Get form data from BLoC state
                          final personalDetailsModel =
                              PersonalDetailsModel(
                            name: state.name,
                            mobile: state.mobile,
                            whatsapp: state.whatsapp,
                            bloodgroup: state.bloodGroupId.toString(),
                            relationId: state.relationId.toString(),
                            genderId: state.genderId.toString(),
                            dob: state.dob,
                            maritalStatusId:
                                state.maritalStatusId.toString(),
                            religionId: state.religionId.toString(),
                            casteId: state.casteId.toString(),
                            surveyor: state.surveyor,
                          );

                          context
                              .read<EditFamilyMemberBloc>()
                              .add(
                                SubmitPersonalDetailsEvent(
                                  data: personalDetailsModel,
                                  clientId:
                                      '1', // Replace with actual clientId
                                  editId: int.parse(
                                      widget.data.id ?? ''), // From data model
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
