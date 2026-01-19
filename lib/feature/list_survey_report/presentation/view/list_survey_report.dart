import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';

import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_state.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/widget/survey_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSurveyReport extends StatefulWidget {
  final FamilySurveySectionType sectionType;
  final String postion;
  const ListSurveyReport(
      {super.key, required this.sectionType, required this.postion});

  @override
  State<ListSurveyReport> createState() => _ListSurveyReportState();
}

class _ListSurveyReportState extends State<ListSurveyReport> {
  String get pageTitle {
    switch (widget.sectionType) {
      case FamilySurveySectionType.familyBasicDetails:
        return 'വ്യക്തിഗത വിവരം';
      case FamilySurveySectionType.basicFacilities:
        return 'അടിസ്ഥാന സൗകര്യങ്ങൾ';
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<HeaderListBloc>().add(FetchHeaderList(widget.postion));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(
              title: 'സമർപ്പിച്ച വിവരങ്ങൾ',
              onPress: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchFieldBar(hintText: 'വീട് നമ്പർ / പേര് തിരയുക'),
            ),
            Expanded(
              child: Container(
                color: AppColor.white,
                child: BlocBuilder<HeaderListBloc, HeaderListState>(
                  builder: (context, state) {
                    if (state is HeaderListLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColor.iconColor,
                      ));
                    }

                    if (state is HeaderListLoaded) {
                      if (state.items.isEmpty) {
                        return const Center(
                          child: Text(
                            'വിവരങ്ങൾ ലഭ്യമല്ല',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return PropertyCard(
                            editId: item.editId,
                            position: item.position,
                            sectionType: widget.sectionType,
                            houseNumber: item.houseNumber,
                            houseName: item.houseName,
                            subtitle: item.houseChief,
                            memberCount: item.memberCount,
                            lastUpdated: 'Updated on ${item.lastModified}',
                          );
                        },
                      );
                    }

                    if (state is HeaderListError) {
                      return Center(child: Text(state.message));
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
