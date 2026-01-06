import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';

import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/servey_section.dart';

import 'package:e_member_app/core/widget/text_field/app_radio_field.dart';
import 'package:e_member_app/core/widget/text_field/app_ration_dropdown.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';


import 'package:e_member_app/feature/add_servy_report/data/model/ration_card_model.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/ration_card_repository.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_state.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_item_basic_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddServyItems extends StatefulWidget {
  const AddServyItems({super.key});

  @override
  State<AddServyItems> createState() => _AddServyItemsState();
}

class _AddServyItemsState extends State<AddServyItems> {
  final TextEditingController gardienName = TextEditingController();
  final TextEditingController houseName = TextEditingController();
  final TextEditingController houseNumber = TextEditingController();
  final TextEditingController anualIncome = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();

  String? gender;
  String rationCard = 'yes';
  String casteCert = 'yes';
  String disability = 'yes';
  String widow = 'yes';

  int? selectedRationCard;

  Color rationCardBgColor(int id) {
    switch (id) {
      case 1:
        return const Color(0xFFFFF4C2);
      case 2:
        return const Color(0xFFFFC1D9);
      case 3:
        return const Color(0xFFBFD9FF);
      case 4:
        return const Color(0xFFF1F1F1);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(title: 'സമ്പൂർണ്ണ സർവ്വേ'),

            Expanded(
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
                          label: "കുടുംബനാഥൻ്റെ പേര്",
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
                          controller: houseName, //hintText: "വീട്ടുപേര്",
                          label: "വീട്ടുപേര്",
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
                                controller:
                                    houseNumber, // hintText: "വീട്ടു നമ്പർ",
                                label: "വീട്ടുനമ്പർ",
                                labelColor: AppColor.hintText2,
                                borderColor: AppColor.borderColor,
                                focusedBorderColor: AppColor.primary,
                                labelfontSizes: 12,
                                textColor: AppColor.primary,
                                validator: Validator.houseNumberValidator,
                                width: double.infinity,
                                type: "house_number",
                                height: 40,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: AppTextField(
                                controller: anualIncome,
                                // hintText: "റേഷൻ കാർഡ് നമ്പര്",
                                label: "വാർഷിക വരുമാനം",
                                labelColor: AppColor.hintText2,
                                borderColor: AppColor.borderColor,
                                focusedBorderColor: AppColor.primary,
                                labelfontSizes: 12,
                                validator: Validator.validateIncome,
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
                                controller:
                                    cardNumber, // hintText: "വീട്ടു നമ്പർ",
                                label: "റേഷൻ കാർഡ് നമ്പർ",
                                type: "card_number",
                                validator: Validator.cardNumberValidator,
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
                           // inside your _AddServyItemsState build method

Expanded(
  child: BlocProvider(
    create: (_) => RationCardBloc(repository: RationCardRepository())
      ..add(FetchRationCards()),
    child: BlocBuilder<RationCardBloc, RationCardState>(
      builder: (context, state) {
        if (state is RationCardLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RationCardLoaded) {
          return AppRationDropdown(
            label: "റേഷൻ കാർഡ് തരം",
            validator: Validator.validateSelection<RationCard>,
            labelColor: AppColor.hintText2,
            borderColor: AppColor.border,
            iconColor: AppColor.black,
            value: selectedRationCard,
            items: state.rationCards,
            colorBuilder: rationCardBgColor,
            onChanged: (v) {
              setState(() => selectedRationCard = v); // you can later convert this also to bloc
            },
          );
        } else if (state is RationCardError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    ),
  ),
),

                          ],
                        ),

                        const SizedBox(height: 18),

                        Column(
                          children: [
                            AppRadioField(
                              label: "തൊഴിൽ ഉറപ്പ് കാർഡ് ഉണ്ടോ?",
                              value: rationCard,
                              onChanged: (v) => setState(() => rationCard = v),
                            ),
                            const SizedBox(height: 18),

                            AppRadioField(
                              label: "കുടുംബശ്രീ അംഗമാണോ?",
                              value: casteCert,
                              onChanged: (v) => setState(() => casteCert = v),
                            ),
                            const SizedBox(height: 18),

                            AppRadioField(
                              label: "സർക്കാർ അനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ?",
                              value: disability,
                              onChanged: (v) => setState(() => disability = v),
                            ),
                            const SizedBox(height: 18),

                            AppRadioField(
                              label: "അതിദരിദ്ര കുടുംബമാണോ?",
                              value: widow,
                              onChanged: (v) => setState(() => widow = v),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      const Spacer(), // 👈 pushes button to right half
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width *
                            0.45, // half screen
                        child: AppActionButton(
                          label: "അടുത്തത്",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddItemBasicDetails(),
                              ),
                            );
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
