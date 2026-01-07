import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_state.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemBasicDetails extends StatefulWidget {
  const AddItemBasicDetails({super.key});

  @override
  State<AddItemBasicDetails> createState() => _AddItemBasicDetailsState();
}

class _AddItemBasicDetailsState extends State<AddItemBasicDetails> {
  String? selectedHouseType;
  String? selectedHouseTypeId;
  String? selectedLandType;
  String? selectedLandTypeId;
  String? selectedLandArea;
  String? selectedGeneralNeedsoftheWard;
  String? selectedRequiredBenefit;
  String? selectedwaterFacilityAvailable;
  String? selectedGetBenefit;

  String toilet = 'yes';
  String electricityConnection = 'yes';
  String benefitsReceived = "yes";
  String benefitsWanted = 'yes';
  final List<String> dummyHouseTypes = [
    'പക്കാ വീട്',
    'സെമി പക്കാ വീട്',
    'കച്ച വീട്',
    'വാടക വീട്',
    'വീട് ഇല്ല',
  ];
  final List<String> dummyLandTypes = [
    'സ്വന്തം ഭൂമി',
    'ലീസ് ഭൂമി',
    'പട്ടയ ഭൂമി',
    'സർക്കാർ ഭൂമി',
    'ഭൂമി ഇല്ല',
  ];
  final List<String> dummyLandArea = [
    '1 സെന്റ് താഴെ',
    '1 – 3 സെന്റ്',
    '3 – 5 സെന്റ്',
    '5 – 10 സെന്റ്',
    '10 സെന്റിന് മുകളിൽ',
  ];
  final List<String> dummyWaterFacilities = [
    'കിണർ',
    'പൈപ്പ് വെള്ളം',
    'പൊതു ടാപ്പ്',
    'ബോർവെൽ',
    'കുടിവെള്ള സൗകര്യം ഇല്ല',
  ];
  final List<String> dummyRequiredBenefits = [
    'വീടിനുള്ള സഹായം',
    'ഭൂമി ലഭ്യമാക്കൽ',
    'കുടിവെള്ള സൗകര്യം',
    'വൈദ്യുതി കണക്ഷൻ',
    'ശുചിമുറി നിർമാണ സഹായം',
  ];
  final List<String> dummyElectricityConnection = [
    'ഉണ്ട്',
    'ഇല്ല',
    'അപേക്ഷ നൽകിയിട്ടുണ്ട്',
    'താൽക്കാലിക കണക്ഷൻ',
  ];

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
  child: BlocBuilder<HouseTypeBloc, HouseTypeState>(
    builder: (context, state) {

      if (state is HouseTypeLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is HouseTypeLoaded) {
        return AppDropdownField<String>(
          label: 'വീടിന്റെ തരം',
          selectedValue: selectedHouseType,
          validator: Validator.validateSelection,
          items: state.items.map((e) => e.name).toList(),
          onChanged: (value) {
            setState(() {
              selectedHouseType = value;

              final selectedItem = state.items
                  .firstWhere((e) => e.name == value);

              selectedHouseTypeId = selectedItem.id; 
            });
          },
        );
      }

      if (state is HouseTypeError) {
        return Text(
          'Failed to load',
          style: TextStyle(color: Colors.red),
        );
      }

      return const SizedBox();
    },
  ),
),

                                SizedBox(width: 20),
                             Expanded(
  child: BlocBuilder<LandTypeBloc, LandTypeState>(
    builder: (context, state) {

      if (state is LandTypeLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is LandTypeLoaded) {
        return AppDropdownField<String>(
          label: 'ഭൂമിയുടെ തരം',
          selectedValue: selectedLandType,
          validator: Validator.validateSelection,
          items: state.items.map((e) => e.name).toList(),
          onChanged: (value) {
            setState(() {
              selectedLandType = value;

              final selectedItem = state.items
                  .firstWhere((e) => e.name == value);

              selectedLandTypeId = selectedItem.id;
            });
          },
        );
      }

      if (state is LandTypeError) {
        return const Text(
          'Failed to load',
          style: TextStyle(color: Colors.red),
        );
      }

      return const SizedBox();
    },
  ),
),

                              ],
                            ),
                            SizedBox(height: 18),
                            AppDropdownField<String>(
                              label: 'ഭൂമിയുടെ വിസ്തീർണ്ണം (സെന്റ്)',
                              selectedValue: selectedLandArea,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'പക്കാ വീട്',
                                'സെമി പക്കാ വീട്',
                                'കച്ച വീട്',
                                'വാടക വീട്',
                                'വീട് ഇല്ല',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedLandArea = value;
                                });
                              },
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
                                  if (v == 'no') {
                                    selectedLandType = null; // reset dropdown
                                  }
                                });
                              },
                            ),

                            if (electricityConnection == 'yes') ...[
                              const SizedBox(height: 18),

                              AppDropdownField<String>(
                                label: 'കുടിവെള്ള സൗകര്യം',
                                selectedValue: selectedwaterFacilityAvailable,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  'പക്കാ വീട്',
                                  'സെമി പക്കാ വീട്',
                                  'കച്ച വീട്',
                                  'വാടക വീട്',
                                  'വീട് ഇല്ല',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedwaterFacilityAvailable = value;
                                  });
                                },
                              ),
                            ],
                            SizedBox(height: 18),
                            AppRadioField(
                              label: "നിലവിൽആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ?",
                              value: benefitsReceived,
                              // onChanged: (v) => setState(() =>
                              // electricityConnection = v),
                              onChanged: (v) {
                                setState(() {
                                  benefitsReceived = v;
                                  if (v == 'no') {
                                    // benefitsReceived = null;
                                    // selectedLandType = null; // reset dropdown
                                  }
                                });
                              },
                            ),

                            if (benefitsReceived == 'yes') ...[
                              const SizedBox(height: 18),

                              AppDropdownField<String>(
                                label: 'ലഭിച്ച ആനുകൂല്യം',
                                selectedValue: selectedGetBenefit,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  'പക്കാ വീട്',
                                  'സെമി പക്കാ വീട്',
                                  'കച്ച വീട്',
                                  'വാടക വീട്',
                                  'വീട് ഇല്ല',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedGetBenefit = value;
                                  });
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
                                  if (v == 'no') {
                                    // benefitsReceived = null;
                                    // selectedLandType = null; // reset dropdown
                                  }
                                });
                              },
                            ),

                            if (benefitsWanted == 'yes') ...[
                              const SizedBox(height: 18),

                              AppDropdownField<String>(
                                label: 'ആവശ്യമുള്ള ആനുകൂല്യം',
                                selectedValue: selectedRequiredBenefit,
                                borderColor: AppColor.borderColor,
                                labelColor: AppColor.hintText2,
                                selectedTextColor: AppColor.primary,
                                iconColor: AppColor.black,
                                dropdownBgColor: AppColor.white,
                                dropdownTextColor: AppColor.hintText,
                                validator: Validator.validateSelection,
                                items: const [
                                  'പക്കാ വീട്',
                                  'സെമി പക്കാ വീട്',
                                  'കച്ച വീട്',
                                  'വാടക വീട്',
                                  'വീട് ഇല്ല',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedRequiredBenefit = value;
                                  });
                                },
                              ),
                            ],

                            const SizedBox(height: 18),

                            AppDropdownField<String>(
                              label: 'വാർഡിലെ പൊതുവായ ആവശ്യങ്ങൾ',
                              selectedValue: selectedGeneralNeedsoftheWard,
                              borderColor: AppColor.borderColor,
                              labelColor: AppColor.hintText2,
                              selectedTextColor: AppColor.primary,
                              iconColor: AppColor.black,
                              dropdownBgColor: AppColor.white,
                              dropdownTextColor: AppColor.hintText,
                              validator: Validator.validateSelection,
                              items: const [
                                'പക്കാ വീട്',
                                'സെമി പക്കാ വീട്',
                                'കച്ച വീട്',
                                'വാടക വീട്',
                                'വീട് ഇല്ല',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedGeneralNeedsoftheWard = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),

                      AppActionButton(
                        label: "സമർപ്പിക്കുക",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListSurveyReport(),
                            ),
                          );
                        },
                        labelStyle: const TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        height: 44,
                      ),
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
