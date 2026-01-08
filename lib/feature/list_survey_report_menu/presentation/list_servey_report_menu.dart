  import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/menu_containar.dart';
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
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            const GradientHeader(backText: 'back'),
            SizedBox(height: 20),
            Container(
              height: 600,
             // height: double.infinity,
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
                      iconAsset: 'assets/images/menu_icon11.png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightBlue,
                      iconColor: AppColor.iconColor,
                      titleColor: AppColor.iconColor,

                    ),
                    SizedBox(height: 15),
                    MenuContainar(
                      title: 'അടിസ്ഥാന സൗകര്യങ്ങൾ',
                      iconAsset: 'assets/images/menu_icon_12.png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightgreen,
                      iconColor: AppColor.green,
                      titleColor: AppColor.green,  ),
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
  
