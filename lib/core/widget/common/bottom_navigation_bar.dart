// import 'package:e_member_app/core/theme/app_color/app_color.dart';
// import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
// import 'package:e_member_app/feature/list_family_menu/presentation/view/list_family_menu.dart';
// import 'package:e_member_app/feature/list_servey_report_menu/list_servey_report_menu.dart';
// import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class MainBottomBar extends StatefulWidget {
//   final int currentIndex;
//   const MainBottomBar({super.key, required this.currentIndex});

//   @override
//   State<MainBottomBar> createState() => _MainBottomBarState();
// }

// class _MainBottomBarState extends State<MainBottomBar> {
//   final navigationKey = GlobalKey<CurvedNavigationBarState>();
//   late int _index;

//   @override
//   void initState() {
//     super.initState();
//     _index = widget.currentIndex;
//   }

//   void _onNavTap(int index) {
//     if (index == _index) return;

//     setState(() => _index = index);

//     Widget page;
//     switch (index) {
//       case 0:
//         page = const ListServeyReportMenu();
//         break;

//       default:
//         page = const ListFamilyMenu();
//     }

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => page),
//     );
//   }

//   final items = <Widget>[
//     Icon(Icons.file_open, color: AppColor.white),
//     Image(
//       image: AssetImage("assets/images/vaadin_family.png"),
//       height: 27,
//       width: 28,
//     ),

//     // Image(image: AssetImage("assets/Group 2800.png"), height: 27, width: 28),
//   ];
//   final label = ['സർവേ', 'കുടുംബങ്ങൾ'];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(),

//       child: Stack(
//         children: [
//           Positioned(
//             child: CurvedNavigationBar(
//               key: navigationKey,
//               color: AppColor.primary,
//               buttonBackgroundColor: AppColor.primary,

//               animationCurve: Curves.bounceIn,
//               items: items,

//               backgroundColor: Colors.transparent,

//               height: 60,
//               index: _index,
//               onTap: _onNavTap,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(label.length, (i) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _index = i;
//                       navigationKey.currentState?.setPage(i);
//                     });
//                   },
//                   child: Text(
//                     label[i],
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: _index == i
//                           ? FontWeight.bold
//                           : FontWeight.normal,
//                       color: _index == i ? AppColor.white : AppColor.black,
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/view/list_family_menu.dart';
import 'package:e_member_app/feature/list_servey_report_menu/list_servey_report_menu.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final double height;

  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    this.height = 80,
  });

  /// ---------------- NAVIGATION ----------------
  void _onTap(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const DashboardPage();
        break;
      case 1:
        page = const ListServeyReportMenu();
        break;
      // case 2:
      //   page = const ListFamily(();
      //   break;
      // case 3:
      //   page = const AddItemBasicDetails();
      //   break;
      default:
        page = const ListFamilyMenu();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [

        /// MAIN NAV BAR
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColor.primaryGradient,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),

        /// LIGHT GRADIENT BOTTOM
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.45,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
    colors: [ AppColor.primary,AppColor.primaryLight],
    begin: Alignment.topRight,
    end: Alignment.topLeft,
  ),
            ),
          ),
        ),

        /// NAV ITEMS (4 ITEMS)
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(context, 0),
              _navItem(context, 1),

              const SizedBox(width: 70), // 👈 SPACE FOR FAB

              _navItem(context, 2),
              _navItem(context, 3),
            ],
          ),
        ),

        /// CENTER FLOATING ACTION BUTTON
        Positioned(
          top: -30,
          child: GestureDetector(
            onTap: () {
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider(
      create: (_) => RationCardBloc(
        FamilyDropRepositoryImpl(),
      )..add(FetchRationCards()),
      child:
       const AddServyItems(mode: PageMode.add), 
    ),
  ),
);
            },
            child: Container(
              height: 62,
              width: 62,
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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/survey_nav_bar.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// ---------------- NAV ITEM ----------------
  Widget _navItem(BuildContext context, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(context, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            _image(index),
            width: 24,
            height: 24,
            color: isSelected ? AppColor.white : AppColor.grey1,
          ),
          const SizedBox(height: 4),
          Text(
            _label(index),
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColor.white : AppColor.grey1,
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- ICONS ----------------
  String _image(int index) {
    switch (index) {
      case 0:
        return 'assets/images/Vector (1).png';
      case 1:
        return 'assets/icons/family_nav_bar.png';
      case 2:
        return 'assets/icons/family_member_nav_bar.png';
    
      default:
        return 'assets/icons/benefits_nav_bar.png';
    }
  }

  /// ---------------- LABELS ----------------
  String _label(int index) {
    switch (index) {
      case 0:
        return "ഡാഷ്‌ബോർഡ്";
      case 1:
        return "കുടുംബങ്ങൾ";
      case 2:
        return "അംഗങ്ങൾ";

      default:
          return "ആനുകൂല്യങ്ങൾ";
    }
  }
}