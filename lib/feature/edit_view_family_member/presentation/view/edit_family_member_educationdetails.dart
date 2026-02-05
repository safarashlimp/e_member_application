import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/education/education_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/qualification/qualification_state.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_event.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberEducationdetails extends StatefulWidget {
  final PageMode mode;
  final EducationResponse data;
  final String? editId;
  final String position;

  const EditFamilyMemberEducationdetails({
    super.key,
    required this.mode,
    required this.data,
    this.editId,
    required this.position,
  });

  bool get isEdit => mode == PageMode.edit;

  @override
  State<EditFamilyMemberEducationdetails> createState() =>
      _EditFamilyMemberEducationdetailsState();
}

class _EditFamilyMemberEducationdetailsState
    extends State<EditFamilyMemberEducationdetails> {
  final TextEditingController courseStudy = TextEditingController();
  final TextEditingController studyCenter = TextEditingController();
  final TextEditingController surveyorNameLabel = TextEditingController();
    final GlobalKey surveyorKey = GlobalKey();
      final FocusNode surveyorFocus = FocusNode();
  String? selectedEducation;
  String? selectedEducationId;
  String? selectedQualification;
  String? selectedQualificationId;
 bool _isSubmitting = false; 
  int student = 0;
  int needEducationHelp = 0;
  bool _allDataLoaded = false;

  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;

  bool _checkAllLoaded() {
    final qualificationState = context.read<QualificationBloc>().state;
    final educationState = context.read<EducationBloc>().state;

    return qualificationState is QualificationLoaded &&
        educationState is EducationLoaded;
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
   

    surveyorFocus.dispose();
 
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
    );  if (focusNode != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(focusNode);
      });
    }
  }
  void _populateFields(EducationModel value) {
    courseStudy.text = value.courseOther ?? '';
    studyCenter.text = value.institution ?? '';
    surveyorNameLabel.text = value.surveyor ?? '';

    selectedEducationId = value.courseId;
    selectedQualificationId = value.qualificationId;

    student = int.tryParse(value.currentlyStudying) ?? 0;
    needEducationHelp = int.tryParse(value.needEducationSupport) ?? 0;
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

  @override
  void initState() {
    super.initState();
    _populateFields(widget.data.data.first);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<QualificationBloc, QualificationState>(
          listener: (context, state) {
            if (state is QualificationLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<EducationBloc, EducationState>(
          listener: (context, state) {
            if (state is EducationLoaded && !_allDataLoaded) {
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
                        title: "വിദ്യാഭ്യാസ വിവരം",
                        iconAsset: "assets/images/education.png",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<QualificationBloc, QualificationState>(
                              builder: (context, state) {
                                if (state is QualificationLoaded) {
                                  if (selectedQualificationId != null &&
                                      selectedQualification == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == selectedQualificationId,
                                      orElse: () => state.items.first,
                                    );
                                    selectedQualification = match.name;
                                  }
                                  return AppDropdownField<String>(
                                    label: 'വിദ്യാഭ്യാസ യോഗ്യത',
                                    selectedValue: selectedQualification,
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
                                        selectedQualification = value;
                                        selectedQualificationId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }
                                if (state is QualificationError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ?",
                              value: student,
                              onChanged: (v) {
                                setState(() {
                                  student = v;
                                });
                              },
                            ),
                            if (student == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<EducationBloc, EducationState>(
                                builder: (context, state) {
                                  if (state is EducationLoaded) {
                                    if (selectedEducationId != null &&
                                        selectedEducation == null) {
                                      final match = state.items.firstWhere(
                                        (e) => e.id == selectedEducationId,
                                        orElse: () => state.items.first,
                                      );
                                      selectedEducation = match.name;
                                    }
                                    return AppDropdownField<String>(
                                      label: ' പഠനം',
                                      selectedValue: selectedEducation,
                                      borderColor: AppColor.borderColor,
                                      labelColor: AppColor.hintText2,
                                      selectedTextColor: AppColor.primary,
                                      iconColor: AppColor.black,
                                      dropdownBgColor: AppColor.white,
                                      dropdownTextColor: AppColor.hintText,
                                      validator: Validator.validateSelection,
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedEducation = value;
                                          selectedEducationId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }
                                  if (state is EducationError) {
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
                                  });
                                },
                              ),
                            ],
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
                              showSuccessDialog(context);
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
                            onPressed: _isSubmitting ? null : () {
                              
                              if (surveyorNameLabel.text.trim().isEmpty) {
                                showSnack(
                                    context, "സർവേ നടത്തിയ ആളുടെ പേര് നൽകുക");
                                _scrollToField(surveyorKey,
                                    focusNode: surveyorFocus);
                                return;
                              }
                              final finalEditId = widget.editId ?? '';

                              if (finalEditId.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        '❌ Error: Member ID is missing. Cannot update without ID.'),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                return;
                              }
                                 setState(() => _isSubmitting = true);
                              final educationModel = EducationModel(
                                qualificationId:
                                    selectedQualificationId.toString(),
                                currentlyStudying: student.toString(),
                                courseId: selectedEducationId.toString(),
                                courseOther: courseStudy.text,
                                institution: studyCenter.text,
                                needEducationSupport:
                                    needEducationHelp.toString(),
                                surveyor: surveyorNameLabel.text,
                              );

                              context.read<EditFamilyMemberBloc>().add(
                                    SubmitEducationDetailsEvent(
                                      data: educationModel,
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
