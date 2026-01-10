import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
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
  const ListSurveyReport({
    super.key,
    required this.sectionType,
    required this.postion,
  });

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

  // -------------------- update------------------------
  // @override
  // void initState() {
  //   super.initState();
  //   // Check for updates when home page loads
  //   _checkForUpdates();
  //   // Check app status
  //   _checkAppStatus();

  // }

  // Future<void> _checkForUpdates() async {
  //   // Simulate checking for updates
  //   await Future.delayed(const Duration(milliseconds: 500));

  //   // Check if update is available
  //   bool isUpdateAvailable = await _isUpdateAvailable();

  //   if (isUpdateAvailable && mounted) {
  //     showAppUpdateDialog(context);
  //   }
  // }

  // // This function checks if an update is available
  // // You can replace this with actual API call or version check
  // Future<bool> _isUpdateAvailable() async {
  //   // Example: Compare current version with server version
  //   // const String currentVersion = "1.0.0";
  //   // String serverVersion = await fetchServerVersion();
  //   // return serverVersion != currentVersion;

  //   // For demo purposes, return true to always show dialog
  //   return true; // Change to false to hide dialog
  // }

  // void showAppUpdateDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return const AppUpdateDialog();
  //     },
  //   );
  // }

  //--------------------------update----------------------
  //===================exp==========
  // Future<void> _checkAppStatus() async {
  //   await Future.delayed(const Duration(milliseconds: 500));

  //   bool expired = await isAppExpired();

  //   if (expired && mounted) {
  //     showAppExpiredDialog(context);
  //   }
  // }

  // }
  // Optional: Function to check if app is expired
  // Future<bool> isAppExpired() async {
  // Example 1: Check with server
  // final response = await http.get(Uri.parse('https://your-api.com/app-status'));
  // final data = json.decode(response.body);
  // return data['is_expired'] ?? false;

  // Example 2: Check expiry date
  // final expiryDate = DateTime(2024, 12, 31);
  // return DateTime.now().isAfter(expiryDate);

  // For demo purposes
  //   return false; // Change to true to test the dialog
  // }

  //=============exp=============
  @override
  void initState() {
    super.initState();
    context.read<HeaderListBloc>().add(FetchHeaderList(widget.postion));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => DashboardPage()),
            (route) => false,
          );
        },
        child: Scaffold(
          backgroundColor: AppColor.secondary,
          body: Column(
            children: [
              GradientHeader(
                title: 'സമർപ്പിച്ച വിവരങ്ങൾ',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
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
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is HeaderListLoaded) {
                        return ListView.builder(
                          itemCount: state.items.length,

                          itemBuilder: (context, index) {
                            final item = state.items[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PropertyCard(
                                editId: item.editId,
                                position: item.position,
                                sectionType: widget.sectionType,
                                houseNumber: item.houseNumber,
                                houseName: item.houseName,
                                subtitle: item.houseChief,
                                memberCount: item.memberCount,
                                lastUpdated: 'Updated on ${item.lastModified}',
                              ),
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
      ),
    );
  }
}
