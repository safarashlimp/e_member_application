import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/view/add_family_members.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_item_basic_details.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
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
        page = const ListSurveyReport();
        break;

      default:
        page = const ListFamily();
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



class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final double height;
  const AppBottomNav({super.key, required this.selectedIndex, this.height = 80});

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ListSurveyReport()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ListFamily()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AddServyItems()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AddFamilyMembers()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AddItemBasicDetails()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    //  Container(
    //   height: 80,
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [Color(0xff0086D1), Color(0xff004E92)],
    //     ),
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(28),
    //       topRight: Radius.circular(28),
    //     ),
    //   ),
     Stack(
      clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height + 0,
            width: double.infinity,
            decoration: BoxDecoration(gradient: AppColor.primaryGradient,
             borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: 
                  Radius.circular(24),
                
                ),
            ),
          ),

          /// 🔹 LIGHT GRADIENT
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                gradient: AppColor.primaryGradientLight,
                borderRadius: const BorderRadius.only(
                  //topRight: Radius.circular(15),
                ),
              ),
            ),
          ),

          /// NORMAL BUTTONS ROW
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) {
                  if (index == selectedIndex) {
                    return const SizedBox(width: 60); // Space for pop-up button
                  }
                  return _normalItem(context, index);
                }),
              ),
            ),
          ),

          /// POP-UP BUTTON (DYNAMIC)
          Positioned(
            top: -26, // adjust as needed
            child: GestureDetector(
              onTap: () => _onTap(context, selectedIndex),
              child: Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.button, width: 4),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(
                      _icon(selectedIndex),
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Text("fghjk")
                ],
              ),
              
            ),
          
          ),
        ],
      );
   // );
  }

  /// NORMAL ICON
  Widget _normalItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => _onTap(context, index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _icon(index),
            color: Colors.white70,
          ),
          const SizedBox(height: 4),
          Text(
            _label(index),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  IconData _icon(int index) {
    switch (index) {
      case 0:
        return Icons.assignment;
      case 1:
        return Icons.groups;
      case 2:
        return Icons.assignment_turned_in;
      case 3:
        return Icons.trending_up;
      case 4:
        return Icons.settings;
      default:
        return Icons.circle;
    }
  }

  String _label(int index) {
    switch (index) {
      case 0:
        return "Family";
      case 1:
        return "Members";
      case 2:
        return "Survey";
      case 3:
        return "Progress";
      case 4:
        return "Settings";
      default:
        return "";
    }
  }
}

