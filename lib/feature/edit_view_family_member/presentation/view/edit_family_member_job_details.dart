import 'dart:convert';
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_dowm_multiple_selector.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/emloyment/employment_status_dart_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/farming%20type/farming_bloc_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/farming%20type/farming_bloc_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/jobs/job_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_state.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_event.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyJobDetails extends StatefulWidget {
  final PageMode mode;
  final EmploymentResponse data;
  final String? editId;
  final String position;

  const EditFamilyJobDetails({
    super.key,
    required this.mode,
    required this.data,
    this.editId,
    required this.position,
  });

  @override
  State<EditFamilyJobDetails> createState() => _EditFamilyJobDetailsState();
}

class _EditFamilyJobDetailsState extends State<EditFamilyJobDetails> {
  final TextEditingController specifySkillLabel = TextEditingController();
  final TextEditingController surveyorNameLabel = TextEditingController();
  String? skillsLabel;
  String? employmentStatusId;
  String? employmentSupportLabel;
  String? employmentStatus;
  String? employmentSupportId;
  String? jobStatus;
  String? jobStatusId;
  String? farmingTypeId;
  int norkaRegisteredLabel = 0;
  List<String> selectedSkills = [];
  String? farmingType;
  List<String> selectedSkillIds = [];
  bool _allDataLoaded = false;
  final GlobalKey surveyorKey = GlobalKey();
      final FocusNode surveyorFocus = FocusNode();
  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;

  bool _checkAllLoaded() {
    final employmentStatusState = context.read<EmploymentStatusBloc>().state;
    final jobState = context.read<JobBloc>().state;
    final skillsState = context.read<SkillsBloc>().state;
    final employmentSupportState = context.read<EmploymentSupportBloc>().state;
    final farmingTypeState = context.read<FarmingTypeBloc>().state;

    return employmentStatusState is EmploymentStatusLoaded &&
        jobState is JobLoaded &&
        skillsState is SkillsLoaded &&
        employmentSupportState is EmploymentSupportLoaded &&
        farmingTypeState is FarmingTypeLoaded;
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
    specifySkillLabel.dispose();
    surveyorNameLabel.dispose();

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

  void _populateFields(EmploymentModel value) {
    employmentStatusId = value.employmentStatusId;
    jobStatusId = value.occupationId;
    employmentSupportId = value.needJobSupportId;
    farmingTypeId = value.agricultureType;
    specifySkillLabel.text = value.skillDetails;

    // ✅ FIXED: Parse skills JSON array properly
    try {
      final skillsString = value.skills ?? '[]';

      // Handle both JSON array format and comma-separated format
      if (skillsString.trim().startsWith('[')) {
        // It's a JSON array like "[1, 2, 3]"
        final decoded = jsonDecode(skillsString) as List;
        selectedSkillIds = decoded.map((e) => e.toString()).toList();
      } else {
        // It's a comma-separated string like "1,2,3"
        selectedSkillIds = skillsString
            .split(',')
            .where((e) => e.trim().isNotEmpty)
            .map((e) => e.trim())
            .toList();
      }

      print('✅ Loaded skill IDs: $selectedSkillIds');
    } catch (e) {
      print('❌ Error parsing skills: $e');
      selectedSkillIds = [];
    }

    norkaRegisteredLabel = int.tryParse(value.norkaRegistered) ?? 0;
    surveyorNameLabel.text = value.surveyor;
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
        BlocListener<EmploymentStatusBloc, EmploymentStatusState>(
          listener: (context, state) {
            if (state is EmploymentStatusLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<JobBloc, JobState>(
          listener: (context, state) {
            if (state is JobLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<SkillsBloc, SkillsState>(
          listener: (context, state) {
            if (state is SkillsLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<EmploymentSupportBloc, EmploymentSupportState>(
          listener: (context, state) {
            if (state is EmploymentSupportLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<FarmingTypeBloc, FarmingTypeState>(
          listener: (context, state) {
            if (state is FarmingTypeLoaded && !_allDataLoaded) {
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
                        title: "തൊഴിൽ വിവരം",
                        iconAsset: "assets/images/job.png",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<EmploymentStatusBloc,
                                EmploymentStatusState>(
                              builder: (context, state) {
                                if (state is EmploymentStatusLoaded) {
                                  if (employmentStatusId != null &&
                                      employmentStatus == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == employmentStatusId,
                                      orElse: () => state.items.first,
                                    );
                                    employmentStatus = match.name;
                                  }
                                  return AppDropdownField<String>(
                                    label: 'തൊഴിൽ നില',
                                    selectedValue: employmentStatus,
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
                                        employmentStatus = value;
                                        employmentStatusId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }
                                if (state is EmploymentStatusError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<JobBloc, JobState>(
                              builder: (context, state) {
                                if (state is JobLoaded) {
                                  if (jobStatusId != null &&
                                      jobStatus == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == jobStatusId,
                                      orElse: () => state.items.first,
                                    );
                                    jobStatus = match.name;
                                  }
                                  return AppDropdownField<String>(
                                    label: 'തൊഴിൽ',
                                    selectedValue: jobStatus,
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
                                        jobStatus = value;
                                        jobStatusId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }
                                if (state is JobError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20),
                            BlocBuilder<SkillsBloc, SkillsState>(
                              builder: (context, state) {
                                if (state is SkillsLoaded) {
                                  if (selectedSkillIds.isNotEmpty &&
                                      selectedSkills.isEmpty) {
                                    selectedSkills = state.items
                                        .where((e) =>
                                            selectedSkillIds.contains(e.id))
                                        .map((e) => e.name)
                                        .toList();
                                  }

                                  return AppMultiSelectDropdown<String>(
                                    label: 'കഴിവുകൾ / വൈദഗ്ധ്യങ്ങൾ',
                                    items:
                                        state.items.map((e) => e.name).toList(),
                                    selectedValues: selectedSkills,
                                    onChanged: (values) {
                                      setState(() {
                                        selectedSkills = values;
                                        selectedSkillIds = state.items
                                            .where(
                                                (e) => values.contains(e.name))
                                            .map((e) => e.id)
                                            .toList();
                                      });
                                    },
                                  );
                                }
                                if (state is SkillsError) {
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
                            BlocBuilder<EmploymentSupportBloc,
                                EmploymentSupportState>(
                              builder: (context, state) {
                                if (state is EmploymentSupportLoaded) {
                                  if (employmentSupportId != null &&
                                      employmentSupportLabel == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == employmentSupportId,
                                      orElse: () => state.items.first,
                                    );
                                    employmentSupportLabel = match.name;
                                  }
                                  return AppDropdownField<String>(
                                    label: 'തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ?',
                                    selectedValue: employmentSupportLabel,
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
                                        employmentSupportLabel = value;
                                        employmentSupportId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }
                                if (state is EmploymentSupportError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            if (employmentStatus == "വിദേശത്ത്") ...[
                              const SizedBox(height: 20),
                              AppRadioField(
                                label: "  നോർക്കയിൽ രജിസ്റ്റർ ചെയ്തിട്ടുണ്ടോ?",
                                value: norkaRegisteredLabel,
                                onChanged: (v) {
                                  setState(() {
                                    norkaRegisteredLabel = v;
                                  });
                                },
                              ),
                            ],
                            if (jobStatus == "കർഷകൻ") ...[
                              const SizedBox(height: 20),
                              BlocBuilder<FarmingTypeBloc, FarmingTypeState>(
                                builder: (context, state) {
                                  if (state is FarmingTypeLoaded) {
                                    if (farmingTypeId != null &&
                                        farmingType == null) {
                                      final match = state.items.firstWhere(
                                        (e) => e.id == farmingTypeId,
                                        orElse: () => state.items.first,
                                      );
                                      farmingType = match.name;
                                    }
                                    return AppDropdownField<String>(
                                      label: 'ഏത് തരം കൃഷി ചെയ്യുന്നത് ?',
                                      selectedValue: farmingType,
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
                                          farmingType = value;
                                          farmingTypeId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }
                                  if (state is FarmingTypeError) {
                                    return Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }
                                  return const SizedBox();
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
                                ? "സമർപ്പിക്കുന്നു..."
                                : "സമർപ്പിക്കുക",
                            onPressed: () {

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
                              final employmentModel = EmploymentModel(
                                employmentStatusId: employmentStatusId ?? '',
                                occupationId: jobStatusId ?? '',
                                skills: jsonEncode(selectedSkillIds),
                                skillDetails: specifySkillLabel.text,
                                needJobSupportId: employmentSupportId ?? '',
                                norkaRegistered:
                                    norkaRegisteredLabel.toString(),
                                agricultureType: farmingTypeId ?? '',
                                surveyor: surveyorNameLabel.text,
                              );

                              context.read<EditFamilyMemberBloc>().add(
                                    SubmitEmploymentDetailsEvent(
                                      data: employmentModel,
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
