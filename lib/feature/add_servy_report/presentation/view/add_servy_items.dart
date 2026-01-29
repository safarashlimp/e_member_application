import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';
import 'package:e_member_app/core/widget/text_field/app_drop_down.dart';
import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_item_basic_details.dart';
import 'package:e_member_app/feature/edit_survey_report/data/repository/edit_survay_report_imp.dart';
import 'package:e_member_app/feature/edit_survey_report/presentation/house_details/bloc/household/household_bloc.dart';
import 'package:e_member_app/feature/edit_survey_report/presentation/house_details/bloc/household/household_event.dart';
import 'package:e_member_app/feature/edit_survey_report/presentation/house_details/bloc/household/household_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/data/repository/header_list_repository_impl.dart';
import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AddServyItems extends StatefulWidget {
  final PageMode mode;
  final SurveyHeaderModel? headerData;
  final int? editId;
  const AddServyItems(
      {super.key, required this.mode, this.headerData, this.editId});

  @override
  State<AddServyItems> createState() => _AddServyItemsState();
}

class _AddServyItemsState extends State<AddServyItems> {
  final TextEditingController gardienName = TextEditingController();
  final TextEditingController houseName = TextEditingController();
  final TextEditingController houseNumber = TextEditingController();
  final TextEditingController anualIncome = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController surveyornamecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedRationCardLabel;
  String? selectedRationCardId;
  bool hasAttemptedSubmit = false; // Track if user has tried to submit

  String? gender;
  int rationCard = 0;
  int casteCert = 0;
  int disability = 0;
  int widow = 0;

  bool get isEdit => widget.mode == PageMode.edit;
  bool get isView => widget.mode == PageMode.view;
  bool get isAdd => widget.mode == PageMode.add;

  int? selectedRationCard;

  @override
  void initState() {
    super.initState();

    debugPrint('Edit ID in initState: ${widget.editId ?? 'No Edit ID'}');

    if (widget.headerData != null) {
      gardienName.text = widget.headerData!.houseChief;
      houseName.text = widget.headerData!.houseName;
      houseNumber.text = widget.headerData!.houseNumber;
      cardNumber.text = widget.headerData!.rationCardNumber;
      anualIncome.text = widget.headerData?.annualIncome ?? '';

      selectedRationCardId = widget.headerData!.rationCardTypeId;
      rationCard = widget.headerData!.hasJobCard;
      casteCert = widget.headerData!.kudumbashreeMember;
      disability = widget.headerData!.govtBeneficiary;
      widow = widget.headerData!.extremePoor;
      surveyornamecontroller.text = widget.headerData?.surveyor ?? '';
    }

    // Add listeners to clear validation on text change
    gardienName.addListener(_clearValidationOnChange);
    houseName.addListener(_clearValidationOnChange);
    houseNumber.addListener(_clearValidationOnChange);
    anualIncome.addListener(_clearValidationOnChange);
    cardNumber.addListener(_clearValidationOnChange);
    surveyornamecontroller.addListener(_clearValidationOnChange);
  }

  void _clearValidationOnChange() {
    if (hasAttemptedSubmit) {
      setState(() {});
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

    // Navigate to the list page
    Navigator.of(context).pushReplacement(
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
  }

  @override
  void dispose() {
    gardienName.dispose();
    houseName.dispose();
    houseNumber.dispose();
    anualIncome.dispose();
    cardNumber.dispose();
    surveyornamecontroller.dispose();
    super.dispose();
  }

  void _handleSubmit(BuildContext context) {
    setState(() {
      hasAttemptedSubmit = true;
    });

    if (isAdd) {
      final headerData = SurveyHeaderModel(
        houseChief: gardienName.text,
        houseNumber: houseNumber.text,
        houseName: houseName.text,
        rationCardNumber: cardNumber.text,
        rationCardTypeId: selectedRationCardId.toString(),
        annualIncome: double.tryParse(anualIncome.text)?.toString(),
        hasJobCard: rationCard,
        kudumbashreeMember: casteCert,
        govtBeneficiary: disability,
        extremePoor: widow,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => HouseTypeBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchHouseTypes()),
              ),
              BlocProvider(
                create: (_) => LandTypeBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchLandTypes()),
              ),
              BlocProvider(
                create: (_) => WaterFacilityBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchWaterFacilities()),
              ),
              BlocProvider(
                create: (_) => RequiredBenefitBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchRequiredBenefits()),
              ),
              BlocProvider(
                create: (_) => OtherBenefitBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchOtherBenefits()),
              ),
              BlocProvider(
                create: (_) => WardGeneralNeedBloc(
                  FamilyDropRepositoryImpl(),
                )..add(FetchWardGeneralNeeds()),
              ),
            ],
            child: AddItemBasicDetails(
              headerData: headerData,
              mode: PageMode.add,
            ),
          ),
        ),
      );
    } else if (isEdit) {
      if (widget.editId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Edit ID missing'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      context.read<HouseholdSubmitBloc>().add(
            SubmitHouseholdEvent(
              data: SurveyHeaderModel(
                houseChief: gardienName.text,
                houseNumber: houseNumber.text,
                houseName: houseName.text,
                rationCardNumber: cardNumber.text,
                rationCardTypeId: selectedRationCardId.toString(),
                annualIncome: anualIncome.text,
                hasJobCard: rationCard,
                kudumbashreeMember: casteCert,
                govtBeneficiary: disability,
                extremePoor: widow,
                surveyor: surveyornamecontroller.text,
              ),
              editId: widget.editId,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RationCardBloc(FamilyDropRepositoryImpl())
            ..add(FetchRationCards()),
        ),
        BlocProvider(
          create: (_) => HouseholdSubmitBloc(
            repository: HouseholdRepository(),
          ),
        )
      ],
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColor.secondary,
          body: BlocBuilder<RationCardBloc, RationCardState>(
            builder: (context, state) {
              if (state is RationCardLoading) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  ),
                );
              }
              if (state is RationCardError) {
                return Center(child: Text(state.message));
              }

              return Column(
                children: [
                  GradientHeader(
                    title: 'സമ്പൂർണ്ണ സർവ്വേ',
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: hasAttemptedSubmit
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: ListView(
                        padding: EdgeInsets.all(13),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          SurveySection(
                            title: 'കുടുംബത്തിന്റെ അടിസ്ഥാന വിവരങ്ങൾ',
                            iconAsset: 'assets/images/family servy.png',
                            child: Column(
                              children: [
                                AppTextField(
                                  controller: gardienName,
                                  label: "* കുടുംബനാഥൻ്റെ പേര്",
                                  labelColor: AppColor.hintText2,
                                  borderColor: AppColor.borderColor,
                                  focusedBorderColor: AppColor.primary,
                                  labelfontSizes: 12,
                                  validator: Validator.validateName,
                                  textColor: AppColor.primary,
                                  width: double.infinity,
                                  height: 40,
                                ),
                                SizedBox(height: 18),
                                AppTextField(
                                  controller: houseName,
                                  label: "* വീട്ടുപേര്",
                                  labelColor: AppColor.hintText2,
                                  borderColor: AppColor.borderColor,
                                  focusedBorderColor: AppColor.primary,
                                  labelfontSizes: 12,
                                  textColor: AppColor.primary,
                                  validator: Validator.validateHouseName,
                                  width: double.infinity,
                                  height: 40,
                                ),
                                SizedBox(height: 18),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppTextField(
                                        controller: houseNumber,
                                        label: "* വീട്ടുനമ്പർ",
                                        labelColor: AppColor.hintText2,
                                        borderColor: AppColor.borderColor,
                                        focusedBorderColor: AppColor.primary,
                                        labelfontSizes: 12,
                                        textColor: AppColor.primary,
                                        validator:
                                            Validator.houseNumberValidator,
                                        width: double.infinity,
                                        type: "house_number",
                                        height: 40,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: AppTextField(
                                        controller: anualIncome,
                                        label: "വാർഷിക വരുമാനം",
                                        labelColor: AppColor.hintText2,
                                        borderColor: AppColor.borderColor,
                                        focusedBorderColor: AppColor.primary,
                                        labelfontSizes: 12,
                                        // validator: Validator.validateIncome,
                                        type: "income",
                                        textColor: AppColor.primary,
                                        width: double.infinity,
                                        height: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 18),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppTextField(
                                        controller: cardNumber,
                                        label: "* റേഷൻ കാർഡ് നമ്പർ",
                                        type: "card_number",
                                        validator:
                                            Validator.cardNumberValidator,
                                        labelColor: AppColor.hintText2,
                                        borderColor: AppColor.borderColor,
                                        focusedBorderColor: AppColor.primary,
                                        labelfontSizes: 12,
                                        textColor: AppColor.primary,
                                        width: double.infinity,
                                        height: 40,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Flexible(
                                      child: BlocBuilder<RationCardBloc,
                                          RationCardState>(
                                        builder: (context, state) {
                                          if (state is RationCardLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          if (state is RationCardLoaded) {
                                            if (selectedRationCardId != null &&
                                                selectedRationCardLabel ==
                                                    null) {
                                              final match =
                                                  state.items.firstWhere(
                                                (e) =>
                                                    e.id ==
                                                    selectedRationCardId,
                                                orElse: () => state.items.first,
                                              );
                                              selectedRationCardLabel =
                                                  match.name;
                                            }

                                            return AppDropdownField<String>(
                                              label: '* റേഷൻ കാർഡ് തരം',
                                              selectedValue:
                                                  selectedRationCardLabel,
                                              borderColor: AppColor.borderColor,
                                              selectedTextColor:
                                                  AppColor.primary,
                                              dropdownTextColor:
                                                  AppColor.hintText2,
                                              labelColor: AppColor.hintText2,
                                              iconColor: AppColor.black,
                                              dropdownBgColor: AppColor.white,
                                              items: state.items
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedRationCardLabel =
                                                      value;
                                                  selectedRationCardId = state
                                                      .items
                                                      .firstWhere((e) =>
                                                          e.name == value)
                                                      .id;
                                                  // showRationCardError = false;
                                                });
                                              },
                                            );
                                          }

                                          return const SizedBox();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                AppRadioField(
                                  label: "തൊഴിൽ ഉറപ്പ് കാർഡ് ഉണ്ടോ?",
                                  value: rationCard,
                                  onChanged: (v) =>
                                      setState(() => rationCard = v),
                                ),
                                const SizedBox(height: 18),
                                AppRadioField(
                                  label: "കുടുംബശ്രീ അംഗമാണോ?",
                                  value: casteCert,
                                  onChanged: (v) =>
                                      setState(() => casteCert = v),
                                ),
                                const SizedBox(height: 18),
                                AppRadioField(
                                  label:
                                      "സർക്കാർ അനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ?",
                                  value: disability,
                                  onChanged: (v) =>
                                      setState(() => disability = v),
                                ),
                                const SizedBox(height: 18),
                                AppRadioField(
                                  label: "അതിദരിദ്ര കുടുംബമാണോ?",
                                  value: widow,
                                  onChanged: (v) => setState(() => widow = v),
                                ),
                                if (isEdit || isView) ...[
                                  SizedBox(height: 18),
                                  AppTextField(
                                    controller: surveyornamecontroller,
                                    label: "* സർവേ നടത്തിയ ആളുടെ പേര്",
                                    labelColor: AppColor.hintText2,
                                    borderColor: AppColor.borderColor,
                                    focusedBorderColor: AppColor.primary,
                                    labelfontSizes: 12,
                                    textColor: AppColor.primary,
                                    validator: Validator.validateName,
                                    width: double.infinity,
                                  ),
                                ]
                              ],
                            ),
                          ),
                          if (isAdd) ...[
                            Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: AppActionButton(
                                    label: "അടുത്തത്",
                                    onPressed: () {
                                      if (gardienName.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content: Text(
                                                  "കുടുംബനാഥൻ്റെ പേര് നൽകുക")),
                                        );
                                        return;
                                      }

                                      if (houseName.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content:
                                                  Text("വീട്ടുപേര് നൽകുക")),
                                        );
                                        return;
                                      }

                                      if (houseNumber.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content:
                                                  Text("വീട്ടുനമ്പർ നൽകുക")),
                                        );
                                        return;
                                      }
                                      if (cardNumber.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content: Text(
                                                  "റേഷൻ കാർഡ് നമ്പർ നൽകുക")),
                                        );
                                        return;
                                      }

                                      if (selectedRationCardId == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content: Text(
                                                  "റേഷൻ കാർഡ് തരം തിരഞ്ഞെടുക്കുക")),
                                        );
                                        return;
                                      }
                                      if (isEdit) {
                                        if (surveyornamecontroller.text
                                            .trim()
                                            .isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              content: Text(
                                                  "സർവേ നടത്തിയ ആളുടെ പേര് നൽകുക"),
                                            ),
                                          );
                                          return;
                                        }
                                      }
                                      _handleSubmit(context);
                                    },
                                    labelStyle: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    height: 44,
                                    icon: Icons.arrow_forward,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (isEdit) ...[
                            BlocConsumer<HouseholdSubmitBloc,
                                HouseholdSubmitState>(
                              listener: (context, state) {
                                if (state is HouseholdSubmitSuccess) {
                                  showSuccessDialog(context);
                                  // Don't navigate here - let the dialog handle it
                                }

                                if (state is HouseholdSubmitFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(state.message),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is HouseholdSubmitting) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColor.primary,
                                    ),
                                  );
                                }

                                return AppActionButton(
                                  label: 'സമർപ്പിക്കുക',
                                  onPressed: () => _handleSubmit(context),
                                  labelStyle: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  height: 44,
                                  icon: Icons.arrow_forward,
                                );
                              },
                            )
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
