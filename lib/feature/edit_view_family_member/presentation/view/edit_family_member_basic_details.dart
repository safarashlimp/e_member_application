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
  final FocusNode familyNameFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode whatsappFocus = FocusNode();
  final FocusNode surveyorFocus = FocusNode();

  // ✅ ADD THIS: ScrollController
  final ScrollController scrollController = ScrollController();

  // ✅ ADD THESE: GlobalKeys for scroll-to-widget
  final GlobalKey familyNameKey = GlobalKey();
  final GlobalKey mobileKey = GlobalKey();
  final GlobalKey whatsappKey = GlobalKey();
  final GlobalKey bloodGroupKey = GlobalKey();
  final GlobalKey relationKey = GlobalKey();
  final GlobalKey genderKey = GlobalKey();
  final GlobalKey dobKey = GlobalKey();
  final GlobalKey surveyorKey = GlobalKey();

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
  DateTime? selectedDob;
  bool _allDataLoaded = false;
  bool _isSubmitting = false;
  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;

  bool _checkAllLoaded() {
    final bloodGroupState = context.read<BloodGroupBloc>().state;
    final relationState = context.read<RelationDropBloc>().state;
    final genderState = context.read<GenderBloc>().state;
    final maritalState = context.read<MaritalStatusBloc>().state;
    final religionState = context.read<ReligionBloc>().state;
    final casteState = context.read<CasteBloc>().state;

    return bloodGroupState is BloodGroupLoaded &&
        relationState is RelationDropLoaded &&
        genderState is GenderLoaded &&
        maritalState is MaritalStatusLoaded &&
        religionState is ReligionLoaded &&
        casteState is CasteLoaded;
  }

  void _populateFields(PersonalDetailsModel value) {
    // Text fields
    familyMemberName.text = value.name;
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

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xff0FA958),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Updated Successfully",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0FA958),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "നിങ്ങളുടെ വിവരങ്ങൾ വിജയകരമായി അപ്ഡേറ്റ് ചെയ്തു.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 68,
                height: 29,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColor.button),
                  ),
                  onPressed: () {
                    // close dialog
                    _goToListPage(context); // navigate
                  },
                  child: const Text(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    "OK",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _goToListPage(BuildContext context) {
    // Close the success dialog
    Navigator.of(context).pop();

    // Pop back to DetailLoadGate
    Navigator.of(context).pop();
  }

  void showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // ✅ ADD THIS: Dispose focus nodes
    familyNameFocus.dispose();
    mobileFocus.dispose();
    whatsappFocus.dispose();
    surveyorFocus.dispose();
    scrollController.dispose();
    super.dispose();
  }

  // ✅ ADD THIS FUNCTION: Scroll to widget and focus
  void _scrollToField(GlobalKey key, {FocusNode? focusNode}) {
    final ctx = key.currentContext;

    if (ctx == null) return;

    // Close keyboard from previous field
    FocusScope.of(context).unfocus();

    // Scroll first
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      alignment: 0.25,
    );

    // Focus AFTER frame is rendered
    if (focusNode != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(focusNode);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _populateFields(widget.data);

    mobileNumber.addListener(() {
      if (whatsupNumber.text != mobileNumber.text) {
        whatsupNumber.text = mobileNumber.text;

        whatsupNumber.selection = TextSelection.fromPosition(
          TextPosition(offset: whatsupNumber.text.length),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BloodGroupBloc, BloodGroupState>(
          listener: (context, state) {
            if (state is BloodGroupLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<RelationDropBloc, RelationDropState>(
          listener: (context, state) {
            if (state is RelationDropLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<GenderBloc, GenderState>(
          listener: (context, state) {
            if (state is GenderLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<MaritalStatusBloc, MaritalStatusState>(
          listener: (context, state) {
            if (state is MaritalStatusLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<ReligionBloc, ReligionState>(
          listener: (context, state) {
            if (state is ReligionLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<CasteBloc, CasteState>(
          listener: (context, state) {
            if (state is CasteLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
      ],
      child: _allDataLoaded ? _buildForm() : _buildLoadingIndicator(),
    );
  }

  Widget _buildLoadingIndicator() {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(
              title: 'സമ്പൂർണ്ണ സർവ്വേ',
              onPress: () {
                Navigator.pop(context);
              },
            ),
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                  backgroundColor: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return BlocBuilder<EditFamilyMemberBloc, EditFamilyMemberState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: AppColor.secondary,
            body: Column(
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
                              key: familyNameKey,
                              focusNode: familyNameFocus,
                              controller: familyMemberName,
                              label: "* കുടുംബാംഗത്തിന്റെ പേര്",
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
                                    key: mobileKey,
                                    controller: mobileNumber,
                                    focusNode: mobileFocus,
                                    label: "* മൊബൈൽ നമ്പർ",
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
                                    key: whatsappKey,
                                    controller: whatsupNumber,
                                    focusNode: whatsappFocus,
                                    label: "* വാട്സ്ആപ്പ് നമ്പർ",
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
                                if (state is BloodGroupLoaded) {
                                  if (selectedBloodGroupId != null &&
                                      selectedBloodGroup == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedBloodGroupId,
                                      orElse: () => state.items.first,
                                    );
                                    selectedBloodGroup = match.name;
                                  }

                                  return AppDropdownField<String>(
                                    key: bloodGroupKey,
                                    label: '* രക്തഗ്രൂപ്പ്',
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
                                if (state is RelationDropLoaded) {
                                  if (selectedRelationId != null &&
                                      selectedReletion == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedRelationId,
                                      orElse: () => state.items.first,
                                    );
                                    selectedReletion = match.name;
                                  }

                                  return AppDropdownField<String>(
                                    key: relationKey,
                                    label: '* കുടുംബനാഥനുമായുള്ള ബന്ധം',
                                    selectedValue: selectedReletion,
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
                                    key: genderKey,
                                    label: '* ലിംഗം',
                                    selectedValue: selectedGender,
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
                                    key: dobKey,
                                    label: '* ജനനത്തീയതി',
                                    borderColor: AppColor.borderColor,
                                    labelColor: AppColor.hintText2,
                                    iconColor: AppColor.hintText2,
                                    textColor: AppColor.primary,
                                    validator: Validator.validateDate,
                                    controller: selectedDate,
                                    onDateSelected: (DateTime date) {
                                      setState(() {
                                        selectedDob = date;
                                      });
                                    },
                                    focusedBorderColor: AppColor.borderColor,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: BlocBuilder<MaritalStatusBloc,
                                      MaritalStatusState>(
                                    builder: (context, state) {
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
                              key: surveyorKey,
                              focusNode: surveyorFocus,
                              controller: surveyorNameLabel,
                              label: "* സർവേ നടത്തിയ ആളുടെ പേര്",
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
                              setState(() => _isSubmitting = false);
                              showSuccessDialog(context);
                            } else if (state is EditFamilyMemberSubmitFailure) {
                              setState(() => _isSubmitting = false);
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
                            onPressed: _isSubmitting
                                ? null
                                : () {
                                    if (familyMemberName.text.trim().isEmpty) {
                                      showSnack(context,
                                          "കുടുംബാംഗത്തിന്റെ പേര് നൽകുക");
                                      _scrollToField(familyNameKey,
                                          focusNode: familyNameFocus);
                                      return;
                                    }
                                    if (mobileNumber.text.trim().isEmpty) {
                                      showSnack(context, "മൊബൈൽ നമ്പർ നൽകുക");
                                      _scrollToField(mobileKey,
                                          focusNode: mobileFocus);
                                      return;
                                    }
                                    if (!RegExp(r'^[0-9]{10}$')
                                        .hasMatch(mobileNumber.text.trim())) {
                                      showSnack(context,
                                          "മൊബൈൽ നമ്പർ 10 അക്കമായിരിക്കണം");
                                      _scrollToField(mobileKey,
                                          focusNode: mobileFocus);
                                      return;
                                    }

                                    if (whatsupNumber.text.trim().isEmpty) {
                                      showSnack(
                                          context, "വാട്സ്ആപ്പ് നമ്പർ നൽകുക");
                                      _scrollToField(whatsappKey,
                                          focusNode: whatsappFocus);
                                      return;
                                    }
                                    if (!RegExp(r'^[0-9]{10}$')
                                        .hasMatch(whatsupNumber.text.trim())) {
                                      showSnack(context,
                                          "വാട്സ്ആപ്പ് നമ്പർ 10 അക്കമായിരിക്കണം");
                                      _scrollToField(whatsappKey,
                                          focusNode: whatsappFocus);
                                      return;
                                    }
                                    if (selectedBloodGroup == null ||
                                        selectedBloodGroup!.isEmpty) {
                                      showSnack(context,
                                          "രക്തഗ്രൂപ്പ് തിരഞ്ഞെടുക്കുക");
                                      _scrollToField(bloodGroupKey);
                                      return;
                                    }
                                    if (selectedReletion == null ||
                                        selectedReletion!.isEmpty) {
                                      showSnack(context,
                                          "കുടുംബനാഥനുമായുള്ള ബന്ധം തിരഞ്ഞെടുക്കുക");
                                      _scrollToField(relationKey);
                                      return;
                                    }
                                    if (selectedGender == null ||
                                        selectedGender!.isEmpty) {
                                      showSnack(
                                          context, "ലിംഗം തിരഞ്ഞെടുക്കുക");
                                      _scrollToField(genderKey);
                                      return;
                                    }
                                    if (selectedDate == null ||
                                        selectedDate.text.isEmpty) {
                                      showSnack(
                                          context, "ജനനത്തീയതി തിരഞ്ഞെടുക്കുക");
                                      _scrollToField(dobKey);
                                      return;
                                    }

                                    if (surveyorNameLabel.text.trim().isEmpty) {
                                      showSnack(context,
                                          "സർവേ നടത്തിയ ആളുടെ പേര് നൽകുക");
                                      _scrollToField(surveyorKey,
                                          focusNode: surveyorFocus);
                                      return;
                                    }

                                    final finalEditId =
                                        widget.editId ?? widget.data.id ?? '';

                                    if (finalEditId.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              '❌ Error: Member ID is missing. Cannot update without ID.'),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                        ),
                                      );

                                      return; // Don't proceed
                                    }
                                    setState(() => _isSubmitting = true);

                                    final personalDetailsModel =
                                        PersonalDetailsModel(
                                      id: finalEditId,
                                      name: familyMemberName.text,
                                      mobile: mobileNumber.text,
                                      whatsapp: whatsupNumber.text,
                                      bloodgroup:
                                          selectedBloodGroupId.toString(),
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
                                            editId: finalEditId,
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
