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
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
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

  const EditFamilyJobDetails({super.key, required this.mode, required this.data});

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
bool get isEdit => widget.mode == PageMode.edit;
   bool get isView => widget.mode == PageMode.view;
  List<String> selectedSkills = [];
  String? farmingType;
   List<String> selectedSkillIds = [];


 void _populateFields(EmploymentModel value) {
  // Text fields
      employmentStatusId = value.employmentStatusId;
   jobStatusId = value.occupationId;
   employmentSupportId = value.needJobSupportId;
    farmingTypeId=value.agricultureType;

    // 🔹 Multi-select skills
    selectedSkillIds = (value.skills ?? '').split(',');
    skillsLabel = value.skillDetails;

    // 🔹 Radio / checkbox values
    norkaRegisteredLabel = int.tryParse(value.norkaRegistered)??0;

    // 🔹 Text fields
    surveyorNameLabel.text = value.surveyor ?? '';
   // wardMemberLabel.text = value.wardMember ?? '';
}
@override
  void initState() {
  super.initState();
  _populateFields(widget.data.data.first);
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
             GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ',onPress: () {
              Navigator.pop(context);
            },),
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
                                if (state is EmploymentStatusLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

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

                                    // ✅ API DATA
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
                                if (state is JobLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

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

                                    // ✅ API DATA
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
                                if (state is SkillsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is SkillsLoaded) {
                                      if (selectedSkillIds.isNotEmpty && selectedSkills.isEmpty) {
    selectedSkills = state.items
        .where((e) => selectedSkillIds.contains(e.id))
        .map((e) => e.name)
        .toList();
  }
                              
                                  return AppMultiSelectDropdown<String>(
                                    label: 'കഴിവുകൾ / വൈദഗ്ധ്യങ്ങൾ',

                                    // ✅ API DATA
                                    items:
                                        state.items.map((e) => e.name).toList(),

                                    selectedValues: selectedSkills,

                                    onChanged: (values) {
                                      setState(() {
                                        selectedSkills = values;

                                        // store selected IDs also
                                        selectedSkillIds = state.items
                                            .where(
                                              (e) => values.contains(e.name),
                                            )
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
                                if (state is EmploymentSupportLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

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

                                    // ✅ API DATA
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
                                if (v == 0) {
                                  // student = null; // reset dropdown
                                }
                              });
                            },
                            // onChanged: (v) => setState(() => student = v),
                          ),
                        ],
                        if (jobStatus == "കർഷകൻ") ...[
                          const SizedBox(height: 20),
                             BlocBuilder<FarmingTypeBloc, FarmingTypeState>(
                                builder: (context, state) {
                                  if (state is FarmingTypeLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

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

                                      // ✅ API DATA
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
                      //   MaterialPageRoute(builder: (context) => ListFamily(sectionType: SurveySectionType.employment,)),
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
