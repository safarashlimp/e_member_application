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
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemBasicDetails extends StatefulWidget {
  final SurveyHeaderModel headerData;
  final PageMode mode;
  const AddItemBasicDetails({
    super.key,
    required this.mode,
    required this.headerData,
  });

  @override
  State<AddItemBasicDetails> createState() => _AddItemBasicDetailsState();
}

class _AddItemBasicDetailsState extends State<AddItemBasicDetails> {
  final TextEditingController selectedLandAreaController =
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
  int benefitsWanted = 1;

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
                GradientHeader(backText: 'back'),
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
                                            return AppDropdownField<String>(
                                              label: 'വീടിന്റെ തരം',
                                              selectedValue: selectedHouseType,
                                              validator:
                                                  Validator.validateSelection,
                                              items: state.items
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedHouseType = value;

                                                  final selectedItem = state
                                                      .items
                                                      .firstWhere(
                                                        (e) => e.name == value,
                                                      );

                                                  selectedHouseTypeId =
                                                      selectedItem.id;
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
                                            return AppDropdownField<String>(
                                              label: 'ഭൂമിയുടെ തരം',
                                              selectedValue: selectedLandType,
                                              validator:
                                                  Validator.validateSelection,
                                              items: state.items
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedLandType = value;

                                                  final selectedItem = state
                                                      .items
                                                      .firstWhere(
                                                        (e) => e.name == value,
                                                      );

                                                  selectedLandTypeId =
                                                      selectedItem.id;
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
                              // onChanged: (v) => setState(() =>
                              // electricityConnection = v),
                              onChanged: (v) {
                                setState(() {
                                  electricityConnection = v;
                                  if (v == 0) {
                                    selectedLandType = null; // reset dropdown
                                  }
                                });
                              },
                            ),

                            // if (electricityConnection == 1) ...[
                            //   const SizedBox(height: 18),

                            //  if (electricityConnection == 0) ...[
                            const SizedBox(height: 18),
                            BlocBuilder<WaterFacilityBloc, WaterFacilityState>(
                              builder: (context, state) {
                                if (state is WaterFacilityLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is WaterFacilityLoaded) {
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
                                        selectedWaterFacilityId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
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
                            // ],

                            //                             ],
                            SizedBox(height: 18),
                            AppRadioField(
                              label: "നിലവിൽആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ?",
                              value: benefitsReceived,
                              // onChanged: (v) => setState(() =>
                              // electricityConnection = v),
                              onChanged: (v) {
                                setState(() {
                                  benefitsReceived = v;
                                  if (v == 0) {
                                    // benefitsReceived = null;
                                    // selectedLandType = null; // reset dropdown
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

                                  if (state is RequiredBenefitLoaded) {
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
                                          selectedRequiredBenefitId = state
                                              .items
                                              .firstWhere(
                                                (e) => e.name == value,
                                              )
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  if (state is RequiredBenefitLoaded) {
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
                                          selectedRequiredBenefitId = state
                                              .items
                                              .firstWhere(
                                                (e) => e.name == value,
                                              )
                                              .id;
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
                              // onChanged: (v) => setState(() =>
                              // electricityConnection = v),
                              onChanged: (v) {
                                setState(() {
                                  benefitsWanted = v;
                                  if (v == 0) {
                                    // benefitsReceived = null;
                                    // selectedLandType = null; // reset dropdown
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
                                          selectedOtherBenefitId = state.items
                                              .firstWhere(
                                                (e) => e.name == value,
                                              )
                                              .id;
                                        });
                                      },
                                    );
                                  }

                                  // BlocBuilder<OtherBenefitBloc, OtherBenefitState>(
                                  //   builder: (context, state) {
                                  //     if (state is OtherBenefitLoading) {
                                  //       return const Center(
                                  //         child: CircularProgressIndicator(),
                                  //       );
                                  //     }

                                  //     if (state is OtherBenefitLoaded) {
                                  //       return AppDropdownField<String>(
                                  //         label: 'ആവശ്യമുള്ള ആനുകൂല്യം',
                                  //         selectedValue: selectedOtherBenefit,
                                  //         borderColor: AppColor.borderColor,
                                  //         labelColor: AppColor.hintText2,
                                  //         selectedTextColor: AppColor.primary,
                                  //         iconColor: AppColor.black,
                                  //         dropdownBgColor: AppColor.white,
                                  //         dropdownTextColor: AppColor.hintText,
                                  //         validator: Validator.validateSelection,
                                  //         items: state.items
                                  //             .map((e) => e.name)
                                  //             .toList(),
                                  //         onChanged: (value) {
                                  //           setState(() {
                                  //             selectedOtherBenefit = value;
                                  //             selectedOtherBenefitId = state.items
                                  //                 .firstWhere(
                                  //                   (e) => e.name == value,
                                  //                 )
                                  //                 .id;
                                  //           });
                                  //         },
                                  //       );
                                  //     }

                                  //     if (state is OtherBenefitError) {
                                  //       return Text(
                                  //         'Error: ${state.message}',
                                  //         style: const TextStyle(color: Colors.red),
                                  //       );
                                  //     }

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
                                        selectedGeneralNeedId = state.items
                                            .firstWhere((e) => e.name == value)
                                            .id;
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
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      if (isEdit || isAdd) ...[
                        AppActionButton(
                          label: "സമർപ്പിക്കുക",
                          onPressed: () async {
                            if (widget.headerData.houseChief.isEmpty ||
                                widget.headerData.houseNumber.isEmpty ||
                                widget.headerData.houseName.isEmpty ||
                                widget.headerData.rationCardNumber.isEmpty ||
                                widget.headerData.rationCardTypeId.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "അനിവാര്യമായ വിവരങ്ങൾ പൂരിപ്പിക്കുക",
                                  ),
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

                              await HeaderSaveRepository().saveSurveyHeader(
                                houseChief: widget.headerData.houseChief,
                                houseNumber: widget.headerData.houseNumber,
                                houseName: widget.headerData.houseName,
                                rationCardNumber:
                                    widget.headerData.rationCardNumber,
                                rationCardTypeId:
                                    widget.headerData.rationCardTypeId,
                                annualIncome: widget.headerData.annualIncome,

                                hasJobCard: widget.headerData.hasJobCard,
                                kudumbashreeMember:
                                    widget.headerData.kudumbashreeMember,
                                govtBeneficiary:
                                    widget.headerData.govtBeneficiary,
                                extremePoor: widget.headerData.extremePoor,

                                houseTypeId: selectedHouseTypeId!,
                                landTypeId: selectedLandTypeId != null
                                    ? int.parse(selectedLandTypeId!)
                                    : null,
                                landAreaCents: selectedLandAreaController.text,
                                hasToilet: toilet,
                                hasElectricity: electricityConnection,
                                drinkingWaterSourceId: selectedWaterFacilityId,
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
                                  builder: (context) => ListSurveyReport(
                                    sectionType: FamilySurveySectionType
                                        .familyBasicDetails,
                                    headerData: widget.headerData,
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
