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
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberSocielDetails extends StatefulWidget {
  final PageMode mode;
  final WelfareResponse  data;
   
  const EditFamilyMemberSocielDetails({super.key, required this.mode, required this.data});

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
bool get isEdit => widget.mode == PageMode.edit;
   bool get isView => widget.mode == PageMode.view;
  String? isPensionRequired; 
  String? selectedProvertyPrgm;
    String? selectedPensionTypeId;
      final Map<String, int> povertyProgramMap = {
    'അല്ല': 0,
    'തൊഴിലുറപ്പ്': 1,
    'കുടുംബശ്രീ': 2,
    'ഹരിത കർമ്മസേന': 3,
  };

  // pansion required

  String? isPensionRequiredId;
 void _populateFields(WelfareModel value) {
  // Text fields
  
     isIncludedInRationCard = int.tryParse(value.includedInRation) ?? 0;
    isPensionReceiving = int.tryParse(value.receivingPension) ?? 0;

    // 🔹 Dropdown / selection IDs
    selectedPensionTypeId = value.pensionTypeId;
    isPensionRequiredId = value.needPensionTypeId;
    surveyorNameLabel.text = value.surveyor ?? '';
    // 🔹 Poverty program (radio / dropdown)
  selectedProvertyPrgm = povertyProgramMap.entries
        .firstWhere(
          (e) => e.value.toString() == value.povertyPgm.toString(),
          orElse: () => const MapEntry('അല്ല', 0),
        )
        .key;
  }

    // 🔹 Text fields
  
    // 🔹 Text fields

   // wardMemberLabel.text = value.wardMember ?? '';

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
          top: false,
          child: Scaffold(
            backgroundColor: AppColor.secondary,
            body: Column(
              children: [
              GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വെ',onPress: (){
                Navigator.pop(context);
              },),
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
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        SizedBox(height: 20),
                        AppRadioField(
                          label: " പെൻഷൻ ലഭിക്കുന്നുണ്ടോ?",
                          value: isPensionReceiving,
                          onChanged: (v) {
                            setState(() {
                              isPensionReceiving = v;
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        if (isPensionReceiving == 1) ...[
                          const SizedBox(height: 20),
                           BlocBuilder<PensionTypeBloc, PensionTypeState>(
                                builder: (context, state) {
                                  if (state is PensionTypeLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

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

                                      // ✅ API DATA
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
                                if (state is PensionRequiredLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is PensionRequiredLoaded) {
                                                         if ( isPensionRequiredId != null &&
                                isPensionRequired == null) {
                                final match = state.items.firstWhere(
                                  (e) => e.id ==  isPensionRequiredId,
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

                                    // ✅ API DATA
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
                        SizedBox(height: 20,),
                        AppDropdownField<String>(
                                label: 'താങ്കൾ ദരിദ്ര നിർമാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ?',
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
        ));
      },
    );
  }
}
