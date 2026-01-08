import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/view/list_family_menu.dart';
import 'package:e_member_app/feature/list_servey_report_menu/list_servey_report_menu.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainBottomBar extends StatefulWidget {
  final int currentIndex;
  const MainBottomBar({super.key, required this.currentIndex});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.currentIndex;
  }

  void _onNavTap(int index) {
    if (index == _index) return;

    setState(() => _index = index);

    Widget page;
    switch (index) {
      case 0:
        page = const ListServeyReportMenu();
        break;

      default:
        page = const ListFamilyMenu();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  final items = <Widget>[
    Icon(Icons.file_open, color: AppColor.white),
    Image(
      image: AssetImage("assets/images/vaadin_family.png"),
      height: 27,
      width: 28,
    ),

    // Image(image: AssetImage("assets/Group 2800.png"), height: 27, width: 28),
  ];
  final label = ['സർവേ', 'കുടുംബങ്ങൾ'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),

      child: Stack(
        children: [
          Positioned(
            child: CurvedNavigationBar(
              key: navigationKey,
              color: AppColor.primary,
              buttonBackgroundColor: AppColor.primary,

              animationCurve: Curves.bounceIn,
              items: items,

              backgroundColor: Colors.transparent,

              height: 60,
              index: _index,
              onTap: _onNavTap,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(label.length, (i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = i;
                      navigationKey.currentState?.setPage(i);
                    });
                  },
                  child: Text(
                    label[i],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: _index == i
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: _index == i ? AppColor.white : AppColor.black,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
