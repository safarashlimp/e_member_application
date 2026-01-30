import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_state.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_bloc.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_state.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_event.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberSocielDetails extends StatefulWidget {
  final PageMode mode;
  final WelfareResponse data;
  final String? editId;
  final String position;

  const EditFamilyMemberSocielDetails({
    super.key,
    required this.mode,
    required this.data,
    this.editId,
    required this.position,
  });

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
  String? isPensionRequired;
  String? selectedProvertyPrgm;
  String? selectedPensionTypeId;
  String? isPensionRequiredId;
  bool _allDataLoaded = false;
    final GlobalKey surveyorKey = GlobalKey();
      final FocusNode surveyorFocus = FocusNode();
  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;

  final Map<String, int> povertyProgramMap = {
    'അല്ല': 0,
    'തൊഴിലുറപ്പ്': 1,
    'കുടുംബശ്രീ': 2,
    'ഹരിത കർമ്മസേന': 3,
  };

  bool _checkAllLoaded() {
    final pensionTypeState = context.read<PensionTypeBloc>().state;
    final pensionRequiredState = context.read<PensionRequiredBloc>().state;

    return pensionTypeState is PensionTypeLoaded &&
        pensionRequiredState is PensionRequiredLoaded;
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

  void _populateFields(WelfareModel value) {
    isIncludedInRationCard = int.tryParse(value.includedInRation) ?? 0;
    isPensionReceiving = int.tryParse(value.receivingPension) ?? 0;

    selectedPensionTypeId = value.pensionTypeId;
    isPensionRequiredId = value.needPensionTypeId;
    surveyorNameLabel.text = value.surveyor ?? '';

    selectedProvertyPrgm = povertyProgramMap.entries
        .firstWhere(
          (e) => e.value.toString() == value.povertyPgm.toString(),
          orElse: () => const MapEntry('അല്ല', 0),
        )
        .key;
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
        BlocListener<PensionTypeBloc, PensionTypeState>(
          listener: (context, state) {
            if (state is PensionTypeLoaded && !_allDataLoaded) {
              setState(() => _allDataLoaded = _checkAllLoaded());
            }
          },
        ),
        BlocListener<PensionRequiredBloc, PensionRequiredState>(
          listener: (context, state) {
            if (state is PensionRequiredLoaded && !_allDataLoaded) {
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
              title: 'സമ്പൂർണ്ണ സർവ്വെ',
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
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            AppRadioField(
                              label: " പെൻഷൻ ലഭിക്കുന്നുണ്ടോ?",
                              value: isPensionReceiving,
                              onChanged: (v) {
                                setState(() {
                                  isPensionReceiving = v;
                                });
                              },
                            ),
                            if (isPensionReceiving == 1) ...[
                              const SizedBox(height: 20),
                              BlocBuilder<PensionTypeBloc, PensionTypeState>(
                                builder: (context, state) {
                                  if (state is PensionTypeLoaded) {
                                    if (selectedPensionTypeId != null &&
                                        selectedPensionType == null) {
                                      final match = state.items.firstWhere(
                                        (e) => e.id == selectedPensionTypeId,
                                        orElse: () => state.items.first,
                                      );
                                      selectedPensionType = match.name;
                                    }
                                    return AppDropdownField<String>(
                                      label: 'പെൻഷൻ തരം',
                                      selectedValue: selectedPensionType,
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
                                          selectedPensionType = value;
                                          selectedPensionTypeId = state.items
                                              .firstWhere(
                                                  (e) => e.name == value)
                                              .id;
                                        });
                                      },
                                    );
                                  }
                                  if (state is PensionTypeError) {
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
                            BlocBuilder<PensionRequiredBloc,
                                PensionRequiredState>(
                              builder: (context, state) {
                                if (state is PensionRequiredLoaded) {
                                  if (isPensionRequiredId != null &&
                                      isPensionRequired == null) {
                                    final match = state.items.firstWhere(
                                      (e) => e.id == isPensionRequiredId,
                                      orElse: () => state.items.first,
                                    );
                                    isPensionRequired = match.name;
                                  }

                                  return AppDropdownField<String>(
                                    label: 'പെൻഷൻ ആവശ്യമുണ്ടോ?',
                                    selectedValue: isPensionRequired,
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
                                        isPensionRequired = value;
                                        isPensionRequiredId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
                                      });
                                    },
                                  );
                                }
                                if (state is PensionRequiredError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppDropdownField<String>(
                              label:
                                  'താങ്കൾ ദരിദ്ര നിർമാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ?',
                              selectedValue: selectedProvertyPrgm,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'അല്ല',
                                'തൊഴിലുറപ്പ്',
                                'കുടുംബശ്രീ',
                                'ഹരിത കർമ്മസേന',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedProvertyPrgm = value;
                                  isPensionRequiredId =
                                      povertyProgramMap[value]!.toString();
                                });
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
                              final welfareModel = WelfareModel(
                                includedInRation:
                                    isIncludedInRationCard.toString(),
                                receivingPension: isPensionReceiving.toString(),
                                pensionTypeId: selectedPensionTypeId ?? '0',
                                needPensionTypeId: isPensionRequiredId ?? '0',
                                povertyPgm:
                                    povertyProgramMap[selectedProvertyPrgm]
                                            ?.toString() ??
                                        '0',
                                surveyor: surveyorNameLabel.text,
                              );

                              context.read<EditFamilyMemberBloc>().add(
                                    SubmitPensionDetailsEvent(
                                      data: welfareModel,
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
