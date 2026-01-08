import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/app_expired_dialog/app_expired_dialog.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';
import 'package:e_member_app/core/widget/update_dialoge/update_dialoge.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/widget/survey_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSurveyReport extends StatefulWidget {
   final FamilySurveySectionType sectionType;
  const ListSurveyReport({super.key, required this.sectionType});

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
  Future<void> _checkAppStatus() async {
    await Future.delayed(const Duration(milliseconds: 500));

    bool expired = await isAppExpired();

    if (expired && mounted) {
      showAppExpiredDialog(context);
    }
  }

  // }
  // Optional: Function to check if app is expired
  Future<bool> isAppExpired() async {
    // Example 1: Check with server
    // final response = await http.get(Uri.parse('https://your-api.com/app-status'));
    // final data = json.decode(response.body);
    // return data['is_expired'] ?? false;

    // Example 2: Check expiry date
    // final expiryDate = DateTime(2024, 12, 31);
    // return DateTime.now().isAfter(expiryDate);

    // For demo purposes
    return false; // Change to true to test the dialog
  }

  //=============exp=============
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
      //  bottomNavigationBar: MainBottomBar(currentIndex: 0),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//         Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => BlocProvider(
//       create: (_) => RationCardBloc(
//         RationCardRepository(),
//       )..add(FetchRationCards()),
//       child:
//        const AddServyItems(mode: PageMode.add), 
//     ),
//   ),
// );

//           },
//           backgroundColor: AppColor.iconColor, // 💚 changes color
//           foregroundColor: AppColor.white,
//           // optional - icon color
//           shape: const CircleBorder(), // ensures circular shape

//           child: const Icon(Icons.add, size: 24),
//         ),

        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(title: 'സമർപ്പിച്ച വിവരങ്ങൾ'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchFieldBar(hintText: 'വീട് നമ്പർ / പേര് തിരയുക'),
            ),
            Expanded(
              child: Container(
                color: AppColor.white,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return PropertyCard(
                      sectionType: widget.sectionType,
                      houseNumber: '5/123 ',
                      houseName: "കുന്നത്ത് വീട്",
                      subtitle: 'ഫാത്തിമ ഷമ്മ കെ.പ്പം',
                      memberCount: '5',
                      lastUpdated: 'അവസാനം അപ്ഡേറ്റ് 4 ദിവസം മുമ്പ്',
                    );
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
