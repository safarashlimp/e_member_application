import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health%20issue/health_issue_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health%20issue/health_issue_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/health_insurance/health_insurance_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_state.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_event.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyHealthDetails extends StatefulWidget {
  final PageMode mode;
  final HealthResponse data;
    final String? editId;
      final String position;

  const EditFamilyHealthDetails(
      {super.key, required this.mode, required this.data, this.editId , required this.position});

  @override
  State<EditFamilyHealthDetails> createState() =>
      _EditFamilyHealthDetailsState();
}

class _EditFamilyHealthDetailsState extends State<EditFamilyHealthDetails> {
  final TextEditingController treatmentPlaceLabel = TextEditingController();
  final TextEditingController surveyorNameLabel = TextEditingController();
  int patient = 0;
  String? hasHealthIssues;
  int hasDisability = 0;
  int disabilityBenefit = 0;
  int healthInsuranceCard = 0;
  String? healthInsurance;
  String? healthInsuranceId;
  String? requiredHealthSupportsId;
  String? hasHealthIssuesId;
  String? requiredHealthSupports;
  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;
  void _populateFields(HealthModel value) {
    // Text fields

    patient = int.tryParse(value.isPatient) ?? 0;
    hasDisability = int.tryParse(value.disabled) ?? 0;
    disabilityBenefit = int.tryParse(value.disabilityBenefit) ?? 0;
    healthInsuranceCard = int.tryParse(value.insuranceCard) ?? 0;

    // 🔹 Dropdown / selection IDs
   healthInsuranceId= value.insuranceTypeId;
    requiredHealthSupportsId = value.healthHelp;


    // 🔹 Text fields
    treatmentPlaceLabel.text = value.treatmentPlace ?? '';
    surveyorNameLabel.text = value.surveyor ?? '';
    // wardMemberLabel.text = value.wardMember ?? '';

    // 🔹 Diseases (multi-select or text)
    hasHealthIssuesId = value.diseases;
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
    return BlocBuilder<EditFamilyMemberBloc, EditFamilyMemberState>(
      builder: (context, state) {
        return SafeArea(
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
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        if (patient == 1) ...[
                          const SizedBox(height: 20),
                          BlocBuilder<HealthIssueBloc, HealthIssueState>(
                            builder: (context, state) {
                              if (state is HealthIssueLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is HealthIssueLoaded) {
                                if (hasHealthIssuesId != null &&
                                    hasHealthIssues == null) {
                                  final match = state.items.firstWhere(
                                    (e) => e.id == hasHealthIssuesId,
                                    orElse: () => state.items.first,
                                  );

                                  hasHealthIssues = match.name;
                                }
                                return AppDropdownField<String>(
                                  label: 'ആരോഗ്യ പ്രശ്നങ്ങൾ',
                                  selectedValue: hasHealthIssues,
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
                                      hasHealthIssues = value;

                                      hasHealthIssuesId = state.items
                                          .firstWhere((e) => e.name == value)
                                          .id;
                                    });
                                  },
                                );
                              }

                              if (state is HealthIssueError) {
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
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        if (hasDisability == 1) ...[
                          const SizedBox(height: 20),
                          AppRadioField(
                            label: " ഭിന്നശേഷി ആനുകൂല്യം ലഭിക്കുന്നുണ്ടോ?",
                            value: disabilityBenefit,
                            onChanged: (v) {
                              setState(() {
                                disabilityBenefit = v;
                                if (v == 0) {
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
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        if (healthInsuranceCard == 1) ...[
                          const SizedBox(height: 20),
                          BlocBuilder<HealthInsuranceBloc,
                              HealthInsuranceState>(
                            builder: (context, state) {
                              if (state is HealthInsuranceLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is HealthInsuranceLoaded) {
                                if (healthInsuranceId != null &&
                                    healthInsurance == null) {
                                  final match = state.items.firstWhere(
                                    (e) => e.id == healthInsuranceId,
                                    orElse: () => state.items.first,
                                  );

                                  healthInsurance = match.name;
                                }
                                return AppDropdownField<String>(
                                  label: 'ഹെൽത്ത് ഇൻഷൂറൻസ്',
                                  selectedValue: healthInsurance,
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
                                      healthInsurance = value;
                                      healthInsuranceId = state.items
                                          .firstWhere((e) => e.name == value)
                                          .id;
                                    });
                                  },
                                );
                              }

                              if (state is HealthInsuranceError) {
                                return Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.red),
                                );
                              }

                              return const SizedBox();
                            },
                          ),
                        ],
                        const SizedBox(height: 20),
                        BlocBuilder<RequiredHealthSupportBloc,
                            RequiredHealthSupportState>(
                          builder: (context, state) {
                            if (state is RequiredHealthSupportLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is RequiredHealthSupportLoaded) {
                              if (requiredHealthSupportsId != null &&
                                  requiredHealthSupports == null) {
                                final match = state.items.firstWhere(
                                  (e) => e.id == requiredHealthSupportsId,
                                  orElse: () => state.items.first,
                                );

                                requiredHealthSupports = match.name;
                              }

                              return AppDropdownField<String>(
                                label: 'ആവശ്യമായ ആരോഗ്യ സഹായങ്ങൾ',
                                selectedValue: requiredHealthSupports,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,

                                // ✅ API DATA
                                items: state.items.map((e) => e.name).toList(),

                                onChanged: (value) {
                                  setState(() {
                                    requiredHealthSupports = value;

                                    requiredHealthSupportsId = state.items
                                        .firstWhere((e) => e.name == value)
                                        .id;
                                  });
                                },
                              );
                            }

                            if (state is RequiredHealthSupportError) {
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
                    BlocListener<EditFamilyMemberBloc, EditFamilyMemberState>(
                      listener: (context, state) {
                        if (state is EditFamilyMemberSubmitSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${state.screenName} updated successfully!'),
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
                        label: state is EditFamilyMemberSubmitting ? "സമർപ്പിക്കുന്നു..." : "സമർപ്പിക്കുക",
                        onPressed: () {
                           final finalEditId = widget.editId ??'';
                              
                              if (finalEditId.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('❌ Error: Member ID is missing. Cannot update without ID.'),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                               // print('⚠️  WARNING: editId is empty! widget.editId=${widget.editId}, widget.data.id=${widget.data.id}');
                                return; // Don't proceed
                              }
                          final healthModel = HealthModel(
                            isPatient: patient.toString(),
                            diseases: hasHealthIssuesId.toString(),
                            treatmentPlace: treatmentPlaceLabel.text,
                            disabled: hasDisability.toString(),
                            disabilityBenefit: disabilityBenefit.toString(),
                            insuranceCard: healthInsuranceCard.toString(),
                            insuranceTypeId: healthInsuranceId.toString(),
                            healthHelp: requiredHealthSupportsId.toString(),
                            surveyor: surveyorNameLabel.text,
                          );

                          context.read<EditFamilyMemberBloc>().add(
                            SubmitHealthDetailsEvent(
                              data: healthModel,
                              //clientId: '1', // Replace with actual clientId
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
           )   );
      },
    );
  }
}
