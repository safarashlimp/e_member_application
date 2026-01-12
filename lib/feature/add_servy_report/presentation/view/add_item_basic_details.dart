import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/HeaderSaveRepository.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/header_load/domain/scareen2model.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/data/repository/header_list_repository_impl.dart';
import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AddItemBasicDetails extends StatefulWidget {
  final  SurveyHeaderModel? headerData;
   final Screen2Model? screen2HeaderData;
  final PageMode mode;
  const AddItemBasicDetails({
    super.key,
    required this.mode,
     this.headerData,
     this.screen2HeaderData
  });

  @override
  State<AddItemBasicDetails> createState() => _AddItemBasicDetailsState();
}

class _AddItemBasicDetailsState extends State<AddItemBasicDetails> {



void _populateFieldsFromScreen2(Datum datum) {
  // Dropdown IDs
  selectedHouseTypeId = datum.houseTypeId;
  selectedLandTypeId = datum.landTypeId;
  selectedWaterFacilityId = datum.drinkingWaterSourceId;
  selectedRequiredBenefitId = datum.receivedBenefits;
  selectedOtherBenefitId = datum.benefitsRequired;
  selectedGeneralNeedId = datum.wardNeeds;

  // Radio buttons
  toilet = int.tryParse(datum.hasToilet) ?? 0;
  electricityConnection = int.tryParse(datum.hasElectricity) ?? 0;
  benefitsReceived = int.tryParse(datum.receivedHousingBenefit) ?? 0;
  benefitsWanted = int.tryParse(datum.needHousingBenefit) ?? 0;

  // Text fields
  selectedLandAreaController.text = datum.landAreaCents;
  surveyornamecontroller.text = datum.surveyor;
}


@override
void initState() {
  super.initState();

  if (!isAdd && widget.screen2HeaderData != null) {
    _populateFieldsFromScreen2(widget.screen2HeaderData!.data.first);
  }
}





  final TextEditingController selectedLandAreaController =
      TextEditingController();

        final TextEditingController surveyornamecontroller =
      TextEditingController();
  String? selectedHouseType;
  String? selectedHouseTypeId;
  String? selectedLandType;
  String? selectedLandTypeId;
  String? selectedLandArea;
  String? selectedGeneralNeedsoftheWard;
  String? selectedRequiredBenefit;
  String? selectedRequiredBenefitId;
  String? selectedwaterFacilityAvailable;
  String? selectedWaterFacilityId;
  String? selectedGetBenefit;

  String? selectedGeneralNeed;
  String? selectedGeneralNeedId;
  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;
  bool get isAdd => widget.mode == PageMode.add;
  String? selectedOtherBenefit;
  String? selectedOtherBenefitId;
  int toilet = 0;
  int electricityConnection = 0;
  int benefitsReceived = 0;
  int benefitsWanted = 0;

@override

  Widget build(BuildContext context) {
    



    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: BlocBuilder<HouseTypeBloc, HouseTypeState>(
          builder: (context, state) {
            if (state is HouseTypeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HouseTypeError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Column(
              children: [
                GradientHeader(backText: 'back',onPress: () {
                    Navigator.pop(context);
                },),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(13),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SurveySection(
                        title: 'വീടും അടിസ്ഥാന സൗകരയങ്ങളും',
                        iconAsset: 'assets/images/house.png',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child:
                                      BlocBuilder<
                                        HouseTypeBloc,
                                        HouseTypeState
                                      >(
                                        builder: (context, state) {
                                          if (state is HouseTypeLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          if (state is HouseTypeLoaded) {
                                              if (selectedHouseTypeId != null && selectedHouseType == null) {
    final match = state.items.firstWhere(
      (e) => e.id == selectedHouseTypeId,
      orElse: () => state.items.first,
    );
    selectedHouseType = match.name; // ✅ ID → NAME
  }
                                            return AppDropdownField<String>(
                                              label: 'വീടിന്റെ തരം',
                                                      borderColor: AppColor.borderColor,
                                      selectedTextColor: AppColor.primary,
                                      dropdownTextColor: AppColor.hintText2,
                                      dropdownBgColor: AppColor.white,
                                      labelColor: AppColor.hintText2
                                      ,
                                      iconColor: AppColor.black,
                                              selectedValue: selectedHouseType,
                                              validator:
                                                  Validator.validateSelection,
                                              items: state.items
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (value) {
                                                    setState(() {
        selectedHouseType = value;
        selectedHouseTypeId =
            state.items.firstWhere((e) => e.name == value).id;
      });
                                              },
                                            );
                                          }

                                          if (state is HouseTypeError) {
                                            return Text(
                                              'Failed to load',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            );
                                          }

                                          return const SizedBox();
                                        },
                                      ),
                                ),

                                SizedBox(width: 20),
                                Expanded(
                                  child:
                                      BlocBuilder<LandTypeBloc, LandTypeState>(
                                        builder: (context, state) {
                                          if (state is LandTypeLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          if (state is LandTypeLoaded) {
                                             if (selectedLandTypeId != null && selectedLandType == null) {
        final match = state.items.firstWhere(
          (e) => e.id == selectedLandTypeId,
          orElse: () => state.items.first,
        );
        selectedLandType = match.name;
      }

                                            return AppDropdownField<String>(
                                              label: 'ഭൂമിയുടെ തരം',
                                                      borderColor: AppColor.borderColor,
                                      selectedTextColor: AppColor.primary,
                                      dropdownTextColor: AppColor.hintText2,
                                      dropdownBgColor: AppColor.white,
                                      labelColor: AppColor.hintText2
                                      ,
                                      iconColor: AppColor.black,
                                              selectedValue: selectedLandType,
                                              validator:
                                                  Validator.validateSelection,
                                              items: state.items
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (value) {
                                                 setState(() {
            selectedLandType = value;
            selectedLandTypeId =
                state.items.firstWhere((e) => e.name == value).id;
          });
                                              },
                                            );
                                          }

                                          if (state is LandTypeError) {
                                            return const Text(
                                              'Failed to load',
                                              style: TextStyle(
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
                            SizedBox(height: 18),

                            AppTextField(
                              controller: selectedLandAreaController,
                              label: 'ഭൂമിയുടെ വിസ്തീർണ്ണം (സെന്റ്)',
                              labelColor: AppColor.hintText2,
                              borderColor: AppColor.borderColor,
                              focusedBorderColor: AppColor.primary,
                              labelfontSizes: 12,

                              validator: Validator.validateDecimal,

                              textColor: AppColor.primary,
                              width: double.infinity,
                              height: 40,
                            ),

                            SizedBox(height: 18),
                            AppRadioField(
                              label: "ശൗചാലയം",
                              value: toilet,
                              onChanged: (v) => setState(() => toilet = v),
                            ),
                            SizedBox(height: 18),
                            AppRadioField(
                              label: "വൈദ്യുതി കണക്ഷൻ",
                              value: electricityConnection,
                            
                              onChanged: (v) {
                                setState(() {
                                  electricityConnection = v;
                                 if (v == 0) {
  selectedWaterFacilityId = null;
  selectedwaterFacilityAvailable = null;
}

                                });
                              },
                            ),

                         
                            const SizedBox(height: 18),
                            BlocBuilder<WaterFacilityBloc, WaterFacilityState>(
                              builder: (context, state) {
                                if (state is WaterFacilityLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is WaterFacilityLoaded) {
                                   if (selectedWaterFacilityId != null &&
          selectedwaterFacilityAvailable == null) {
        final match = state.items.firstWhere(
          (e) => e.id == selectedWaterFacilityId,
          orElse: () => state.items.first,
        );
        selectedwaterFacilityAvailable = match.name;
      }
                                  return AppDropdownField<String>(
                                    label: 'കുടിവെള്ള സൗകര്യം',
                                    selectedValue:
                                        selectedwaterFacilityAvailable,
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
            selectedwaterFacilityAvailable = value;
            selectedWaterFacilityId =
                state.items.firstWhere((e) => e.name == value).id;
          });
                                    },
                                  );
                                }

                                if (state is WaterFacilityError) {
                                  return Text(
                                    'Error: ${state.message}',
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                         
                            SizedBox(height: 18),
                            AppRadioField(
                              label: "നിലവിൽആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ?",
                              value: benefitsReceived,
                      
                              onChanged: (v) {
                                setState(() {
                                  benefitsReceived = v;
                                  if (v == 0) {
                          
                                  }
                                });
                              },
                            ),
                            if (benefitsReceived == 1) ...[
                              const SizedBox(height: 18),
                              BlocBuilder<
                                RequiredBenefitBloc,
                                RequiredBenefitState
                              >(
                                builder: (context, state) {
                                  if (state is RequiredBenefitLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  // if (state is RequiredBenefitLoaded) {
                                  //   return AppDropdownField<String>(
                                  //     label: 'ലഭിച്ച ആനുകൂല്യം ',
                                  //     selectedValue: selectedRequiredBenefit,
                                  //     borderColor: AppColor.borderColor,
                                  //     labelColor: AppColor.hintText2,
                                  //     selectedTextColor: AppColor.primary,
                                  //     iconColor: AppColor.black,
                                  //     dropdownBgColor: AppColor.white,
                                  //     dropdownTextColor: AppColor.hintText,
                                  //     validator: Validator.validateSelection,
                                  //     items: state.items
                                  //         .map((e) => e.name)
                                  //         .toList(),
                                  //     onChanged: (value) {
                                  //       setState(() {
                                  //         selectedRequiredBenefit = value;
                                  //         selectedRequiredBenefitId = state
                                  //             .items
                                  //             .firstWhere(
                                  //               (e) => e.name == value,
                                  //             )
                                  //             .id;
                                  //       });
                                  //     },
                                  //   );
                                  // }

                                  if (state is RequiredBenefitLoaded) {
                                     if (selectedRequiredBenefitId != null &&
          selectedRequiredBenefit == null) {
        final match = state.items.firstWhere(
          (e) => e.id == selectedRequiredBenefitId,
          orElse: () => state.items.first,
        );
        selectedRequiredBenefit = match.name;
      }
                                    return AppDropdownField<String>(
                                      label: 'ലഭിച്ച ആനുകൂല്യം ',
                                      selectedValue: selectedRequiredBenefit,
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
            selectedRequiredBenefit = value;
            selectedRequiredBenefitId =
                state.items.firstWhere((e) => e.name == value).id;
          });
                                      },
                                    );
                                  }

                                  if (state is RequiredBenefitError) {
                                    return Text(
                                      'Error: ${state.message}',
                                      style: const TextStyle(color: Colors.red),
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                            ],

                            const SizedBox(height: 18),
                            AppRadioField(
                              label: "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ?",
                              value: benefitsWanted,
                            
                              onChanged: (v) {
                                setState(() {
                                  benefitsWanted = v;
                                  if (v == 0) {
                                  
                                  }
                                });
                              },
                            ),

                            if (benefitsWanted == 1) ...[
                              const SizedBox(height: 18),

                              BlocBuilder<OtherBenefitBloc, OtherBenefitState>(
                                builder: (context, state) {
                                  if (state is OtherBenefitLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (state is OtherBenefitLoaded) {
                                     if (selectedOtherBenefitId != null &&
          selectedOtherBenefit == null) {
        final match = state.items.firstWhere(
          (e) => e.id == selectedOtherBenefitId,
          orElse: () => state.items.first,
        );
        selectedOtherBenefit = match.name;
      }
                                    return AppDropdownField<String>(
                                      label: 'ആവശ്യമുള്ള ആനുകൂല്യം',
                                      selectedValue: selectedOtherBenefit,
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
            selectedOtherBenefit = value;
            selectedOtherBenefitId =
                state.items.firstWhere((e) => e.name == value).id;
          });
                                      },
                                    );
                                  }

                         

                                  return const SizedBox();
                                },
                              ),
                            ],

                            const SizedBox(height: 18),
                            BlocBuilder<
                              WardGeneralNeedBloc,
                              WardGeneralNeedState
                            >(
                              builder: (context, state) {
                                if (state is WardGeneralNeedLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is WardGeneralNeedLoaded) {
                                    if (selectedGeneralNeedId != null && selectedGeneralNeed == null) {
        final match = state.items.firstWhere(
          (e) => e.id == selectedGeneralNeedId,
          orElse: () => state.items.first,
        );
        selectedGeneralNeed = match.name;
      }
                                  return AppDropdownField<String>(
                                    label: 'വാർഡിലെ പൊതുവായ ആവശ്യങ്ങൾ',
                                    selectedValue: selectedGeneralNeed,
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
            selectedGeneralNeed = value;
            selectedGeneralNeedId =
                state.items.firstWhere((e) => e.name == value).id;
          });
                                    },
                                  );
                                }

                                if (state is WardGeneralNeedError) {
                                  return Text(
                                    'Error: ${state.message}',
                                    style: const TextStyle(color: Colors.red),
                                  );
                                }

                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 20,)

                             ,      AppTextField(
                              controller: surveyornamecontroller,
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
                      SizedBox(height: 30),
                      if (isEdit || isAdd) ...[
                        AppActionButton(

                          
                          label: "സമർപ്പിക്കുക",
                          onPressed: () async {
                            final header  = widget.headerData;
                           
if (header == null ||
    header.houseChief.isEmpty ||
    header.houseNumber.isEmpty ||
    header.houseName.isEmpty ||
    header.rationCardNumber.isEmpty ||
    header.rationCardTypeId.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("അനിവാര്യമായ വിവരങ്ങൾ പൂരിപ്പിക്കുക"),
    ),
  );
  return;
}

                            if (selectedHouseTypeId == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("വീടിന്റെ തരം തിരഞ്ഞെടുക്കുക"),
                                ),
                              );
                              return;
                            }

                            try {
                              if (selectedLandAreaController.text.isNotEmpty &&
                                  double.tryParse(
                                        selectedLandAreaController.text,
                                      ) ==
                                      null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'ഭൂമിയുടെ വിസ്തീർണ്ണം ശരിയായ സംഖ്യ നൽകുക',
                                    ),
                                  ),
                                );
                                return;
                              }

                              //await
                               HeaderSaveRepository().saveSurveyHeader(


                                surveyor: surveyornamecontroller.text,
  houseChief: widget.headerData?.houseChief,
  houseNumber: widget.headerData?.houseNumber ?? '',
  houseName: widget.headerData?.houseName ?? '',
  rationCardNumber: widget.headerData?.rationCardNumber ?? '',
  rationCardTypeId: widget.headerData?.rationCardTypeId ?? '',
  annualIncome: widget.headerData?.annualIncome,

  hasJobCard: widget.headerData?.hasJobCard ?? 0,
  kudumbashreeMember: widget.headerData?.kudumbashreeMember ?? 0,
  govtBeneficiary: widget.headerData?.govtBeneficiary ?? 0,
  extremePoor: widget.headerData?.extremePoor ?? 0,


                                houseTypeId: selectedHouseTypeId!,
                                landTypeId: (selectedLandTypeId != null &&
        selectedLandTypeId!.isNotEmpty)
    ? int.tryParse(selectedLandTypeId!)
    : null,

                                landAreaCents: selectedLandAreaController.text,
                                hasToilet: toilet,
                                hasElectricity: electricityConnection,
                                drinkingWaterSourceId: selectedWaterFacilityId?? '0',
                                receivedHousingBenefit: benefitsReceived,
                                receivedBenefits: benefitsReceived == 1
                                    ? selectedRequiredBenefitId
                                    : '0',
                                needHousingBenefit: benefitsWanted,
                                benefitsRequired: benefitsWanted == 1
                                    ? selectedOtherBenefitId
                                    : '0',
                                wardNeeds: selectedGeneralNeedId,
                              );

                              // ✅ NAVIGATION WILL WORK NOW
       Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => HeaderListBloc(
        GetHeaderListUsecase(
          HeaderListRepositoryImpl(http.Client()),
        ),
      )..add(FetchHeaderList('1')),
      child: const ListSurveyReport(
        sectionType: FamilySurveySectionType.familyBasicDetails,
        postion: '1',
      ),
    ),
  ),
);


                            } catch (e) {
                              if (selectedHouseTypeId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "വീടിന്റെ തരം തിരഞ്ഞെടുക്കുക",
                                    ),
                                  ),
                                );
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          },

                          labelStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          height: 44,
                        ),
                      ] else if (isView) ...[
                        SizedBox(height: 50),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
