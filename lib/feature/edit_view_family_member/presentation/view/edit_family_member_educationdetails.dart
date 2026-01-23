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
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberEducationdetails extends StatefulWidget {
   final PageMode mode;
      final EducationResponse data;
    final String? editId;
      final String position;

  const EditFamilyMemberEducationdetails({super.key, required this.mode,required this.data,  this.editId,required this.position});
 bool get isEdit => mode == PageMode.edit;
  @override
  State<EditFamilyMemberEducationdetails> createState() => 
      _EditFamilyMemberEducationdetailsState();
}

class _EditFamilyMemberEducationdetailsState
    extends State<EditFamilyMemberEducationdetails> {
  final TextEditingController courseStudy = TextEditingController();
  final TextEditingController studyCenter = TextEditingController();
  final TextEditingController surveyorNameLabel= TextEditingController();
  String? selectedEducation;
    String? selectedEducationId;
  String? selectedQualification;
    String? selectedQualificationId;

  int student = 0 ;
  int needEducationHelp = 0;
 bool get isEdit => widget.mode == PageMode.edit;
   bool get isView => widget.mode == PageMode.view;
bool _isAnyEducationBlocLoading(BuildContext context) {
  final qualificationState = context.watch<QualificationBloc>().state;
  final educationState = context.watch<EducationBloc>().state;
  final editState = context.watch<EditFamilyMemberBloc>().state;

  return qualificationState is QualificationLoading ||
      educationState is EducationLoading ||
      editState is EditFamilyMemberSubmitting;
}


void _populateFields(EducationModel value) {
  // Text fields
    courseStudy.text = value.courseOther ?? '';
    studyCenter.text = value.institution ?? '';
    surveyorNameLabel.text = value.surveyor ?? '';

    // Dropdown labels (names)
    selectedEducationId = value.courseId;
    selectedQualificationId = value.qualificationId;

    // Radio / toggle values
    student = int.tryParse(value.currentlyStudying) ?? 0 ;
    needEducationHelp = int.tryParse(value.needEducationSupport) ?? 0 ;
}

 @override
void initState() {
  super.initState();
  _populateFields(widget.data.data.first);
}
  @override
  Widget build(BuildContext context) {
    final isLoading = _isAnyEducationBlocLoading(context);

    return 
    isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
:
    BlocBuilder<EditFamilyMemberBloc, EditFamilyMemberState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: AppColor.secondary,
            body: Column(
          children: [
             GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ',onPress: (){
              Navigator.pop(context);
            },),
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
                                if (state is QualificationLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is QualificationLoaded) {
                                   // 🔥 ADD THIS (same as ration card logic)
  if ( selectedQualificationId != null && selectedQualification == null) {
    final match = state.items.firstWhere(
      (e) => e.id ==  selectedQualificationId,
      orElse: () => state.items.first,
    );

    selectedQualification= match.name;
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

                                    // ✅ API DATA
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
                              if (v == 0) {
                                // student = null; // reset dropdown
                              }
                            });
                          },
                          // onChanged: (v) => setState(() => student = v),
                        ),
                        if (student == 1) ...[
                          const SizedBox(height: 20),

                          BlocBuilder<EducationBloc, EducationState>(
                                builder: (context, state) {
                                  if (state is EducationLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is EducationLoaded) {
                                    if (selectedEducationId != null && selectedEducation == null) {
    final match = state.items.firstWhere(
      (e) => e.id == selectedEducationId,
      orElse: () => state.items.first,
    );

    selectedEducation= match.name;
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

                                      // ✅ API DATA
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
                                if (v == 0) {
                                  // student = null; // reset dropdown
                                }
                              });
                            },
                            // onChanged: (v) => setState(() => student = v),
                          ),],
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
                      label: state is EditFamilyMemberSubmitting ? "സമർപ്പിക്കുകയാണ്..." : "സമർപ്പിക്കുക",

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
                        final educationModel = EducationModel(
                          qualificationId: selectedQualificationId.toString(),
                          currentlyStudying: student.toString(),
                          courseId: selectedEducationId.toString(),
                          courseOther: courseStudy.text,
                          institution: studyCenter.text,
                          needEducationSupport: needEducationHelp.toString(),
                          surveyor: surveyorNameLabel.text, 
                        );

                        context.read<EditFamilyMemberBloc>().add(
                          SubmitEducationDetailsEvent(
                            data: educationModel,
                         // Replace with actual clientId
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
