import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';
import 'package:e_member_app/feature/list_family/presentatioan/widget/family_member_cart.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';

import 'package:flutter/material.dart';

class ListFamily extends StatefulWidget {
  final SurveySectionType sectionType;
  const ListFamily({super.key, required this.sectionType});

  @override
  State<ListFamily> createState() => _ListFamilyState();
}

class _ListFamilyState extends State<ListFamily> {
  String get pageTitle {
  switch (widget.sectionType) {
    case SurveySectionType.personal:
      return 'വ്യക്തിഗത വിവരം';
    case SurveySectionType.education:
      return 'വിദ്യാഭ്യാസം';
    case SurveySectionType.employment:
      return 'തൊഴിൽ';
    case SurveySectionType.health:
      return 'ആരോഗ്യം';
    case SurveySectionType.welfare:
      return 'ക്ഷേമ വിവരങ്ങൾ';
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNav(selectedIndex: 2),
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(title: 'സമർപ്പിച്ച വിവരങ്ങൾ'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchFieldBar(),
            ),
            Expanded(
              child: Container(
                color: AppColor.white,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return MemberCard(
                      sectionType: widget.sectionType,
                      name: 'ഫാത്തിമ ഷമ്മ കെ.പ്പം',
                      phone: '+91 860662705',
                      whatsapp: '+91 860662705',
                      ward: 'കുടുംബനാമനുമായുള്ള ബന്ധം: മകൾ',
                      age: 'വയസ്: 18',
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
