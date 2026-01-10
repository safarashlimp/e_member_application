import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/menu_condainer.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';

class ListServeyReportMenu extends StatefulWidget {
  const ListServeyReportMenu({super.key});

  @override
  State<ListServeyReportMenu> createState() => _ListServeyReportMenuState();
}

class _ListServeyReportMenuState extends State<ListServeyReportMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNav(selectedIndex: 1),
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(backText: 'back',onPress: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
            },),
            SizedBox(height: 20),
            Container(
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColor.secondary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    MenuContainar(
                      title: 'അടിസ്ഥാന വിവരങ്ങൾ',
                      iconAsset: 'assets/images/Mask group (14).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightBlue,
                      iconColor: AppColor.iconColor,  
                      titleColor: AppColor.iconColor,
                      onIconTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>     ListSurveyReport(
                              sectionType:
                                  FamilySurveySectionType.familyBasicDetails,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    MenuContainar(
                      title: 'അടിസ്ഥാന സൗകര്യങ്ങൾ',
                      iconAsset: 'assets/images/Mask group (15).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightgreen,
                      iconColor: AppColor.green,
                      titleColor: AppColor.green,
                      onIconTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ListSurveyReport(
                              sectionType:
                                  FamilySurveySectionType.basicFacilities,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
