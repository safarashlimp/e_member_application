import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/menu_condainer.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';

import 'package:flutter/material.dart';

class ListFamilyMenu extends StatefulWidget {
  const ListFamilyMenu({super.key});

  @override
  State<ListFamilyMenu> createState() => _ListFamilyMenuState();
}

class _ListFamilyMenuState extends State<ListFamilyMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: MainBottomBar(currentIndex: 1) ,

        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            const GradientHeader(backText: 'back'),
            SizedBox(height: 20),
            Container(
              
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
                      title: 'കുടുംബാംഗത്തിന്റെ വ്യക്തിഗത വിവരം',
                      iconAsset: 'assets/images/Mask group (16).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightBlue,
                      iconColor: AppColor.iconColor,
                      titleColor: AppColor.iconColor,
onIconTap: () {
               Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ListFamily(
          sectionType: SurveySectionType.personal,
        ),
      ),
    );          
},
                    ),
                    SizedBox(height: 15),
                    MenuContainar(
                      title: 'വിദ്യാഭ്യാസം',
                      iconAsset: 'assets/images/Mask group (17).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightgreen,
                      iconColor: AppColor.green,
                      titleColor: AppColor.green, 
                      onIconTap: () {
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ListFamily(
                    sectionType: SurveySectionType.education,
                  )),
                );           
}, ),
                      SizedBox(height: 15),
                    MenuContainar(
                      title: 'തൊഴിൽ',
                      iconAsset: 'assets/images/Mask group (22).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightOrange,
                      iconColor: AppColor.orange,
                      titleColor: AppColor.orange, 
                                   onIconTap: () {
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ListFamily(
                    sectionType: SurveySectionType.employment,
                  )),
                );           
},
                       ),
                      SizedBox(height: 15),
                    MenuContainar(
                      title: 'ആരോഗ്യം',
                      iconAsset: 'assets/images/Mask group (20).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightRed,
                      iconColor: AppColor.red,
                      titleColor: AppColor.red, 
                                   onIconTap: () {
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ListFamily(
                    sectionType: SurveySectionType.health,
                  )),
                );           
},
                       ),
                      SizedBox(height: 15),
                    MenuContainar(
                      title: 'സാമൂഹിക  /  ക്ഷേമ വിവരങ്ങൾ',
                      iconAsset: 'assets/images/Mask group (21).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightPurple,
                      iconColor: AppColor.purple,
                      titleColor: AppColor.purple, 
                                   onIconTap: () {
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ListFamily(
                    sectionType: SurveySectionType.welfare,
                  )),
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