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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyHealthDetails extends StatefulWidget {
  final PageMode mode;
  final HealthResponse data;
  final String? editId;
  final String position;

  const EditFamilyHealthDetails({
    super.key,
    required this.mode,
    required this.data,
    this.editId,
    required this.position,
  });

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
  bool _allDataLoaded = false;

  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;

  bool _checkAllLoaded() {
    final healthIssueState = context.read<HealthIssueBloc>().state;
    final healthInsuranceState = context.read<HealthInsuranceBloc>().state;
    final requiredHealthState = context.read<RequiredHealthSupportBloc>().state;

    return healthIssueState is HealthIssueLoaded &&
        healthInsuranceState is HealthInsuranceLoaded &&
        requiredHealthState is RequiredHealthSupportLoaded;
  }

  void _populateFields(HealthModel value) {
    patient = int.tryParse(value.isPatient) ?? 0;
    hasDisability = int.tryParse(value.disabled) ?? 0;
    disabilityBenefit = int.tryParse(value.disabilityBenefit) ?? 0;
    healthInsuranceCard = int.tryParse(value.insuranceCard) ?? 0;

    healthInsuranceId = value.insuranceTypeId;
    requiredHealthSupportsId = value.healthHelp;

    treatmentPlaceLabel.text = value.treatmentPlace ?? '';
    surveyorNameLabel.text = value.surveyor ?? '';

    hasHealthIssuesId = value.diseases;
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
        BlocListener<HealthIssueBloc, HealthIssueState>(
          listener: (context, state) {
            if (state is HealthIssueLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<HealthInsuranceBloc, HealthInsuranceState>(
          listener: (context, state) {
            if (state is HealthInsuranceLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<RequiredHealthSupportBloc, RequiredHealthSupportState>(
          listener: (context, state) {
            if (state is RequiredHealthSupportLoaded && !_allDataLoaded) {
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
                                });
                              },
                            ),
                            if (patient == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<HealthIssueBloc, HealthIssueState>(
                                builder: (context, state) {
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
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          hasHealthIssues = value;
                                          hasHealthIssuesId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
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
                                });
                              },
                            ),
                            if (hasDisability == 1) ...[
                              const SizedBox(height: 20),
                              AppRadioField(
                                label: " ഭിന്നശേഷി ആനുകൂല്യം ലഭിക്കുന്നുണ്ടോ?",
                                value: disabilityBenefit,
                                onChanged: (v) {
                                  setState(() {
                                    disabilityBenefit = v;
                                  });
                                },
                              ),
                            ],
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " ഹെൽത്ത് ഇൻഷൂറൻസ് കാർഡ് ഉണ്ടോ?",
                              value: healthInsuranceCard,
                              onChanged: (v) {
                                setState(() {
                                  healthInsuranceCard = v;
                                });
                              },
                            ),
                            if (healthInsuranceCard == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<HealthInsuranceBloc,
                                  HealthInsuranceState>(
                                builder: (context, state) {
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
                                      items: state.items
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          healthInsurance = value;
                                          healthInsuranceId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
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
                                    items:
                                        state.items.map((e) => e.name).toList(),
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
