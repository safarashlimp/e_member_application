import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/view/add_family_members.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_item_basic_details.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';





class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final double height;
  const AppBottomNav({super.key, required this.selectedIndex, this.height = 80});

  void _onTap(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
         page = const ListSurveyReport();
        break;
       
      case 1:
        page = const ListFamily();
        break;
        
      case 2:
        page = const AddServyItems();
        break;
      case 3:
        page = const AddFamilyMembers();
        break;
     case 4:
        page = const AddItemBasicDetails();
       
        break;
      default:
        page = const ListSurveyReport();
    }
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
 
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
             child:  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: List.generate(5, (index) {
    if (index == selectedIndex) {
      return const SizedBox(width: 60); // KEEP SAME
    }
    return _normalItem(context, index);
  }),
),

              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: List.generate(5, (index) {
              //     if (index == selectedIndex) {
              //       return const SizedBox(width: 60); // Space for pop-up button
              //     }
              //     return _normalItem(context, index);
              //   }),
              // ),
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
                    height: 55,
                    width: 55,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        _image(selectedIndex),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                 
                ],
              ),
              
            ),
          
          ),
        ],
      );
   // );
  }
Widget _normalItem(BuildContext context, int index) {
  return GestureDetector(
    onTap: () => _onTap(context, index),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // 👈 SPACE ADDED
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            _image(index),
            color: AppColor.white,
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 4),
          Text(
            _label(index),
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

  /// NORMAL ICON
  // Widget _normalItem(BuildContext context, int index) {
  //   return GestureDetector(
  //     onTap: () => _onTap(context, index),
  //     child: Padding(
  //       padding: const EdgeInsets.all(3.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Image.asset(
  //             _image(index),
  //             color: AppColor.white,
  //             width: 24,
  //             height: 24,
  //           ),
  //           const SizedBox(height: 4),
  //           Text(
  //             _label(index),
  //             style: const TextStyle(
  //               color: AppColor.white,
  //               fontSize: 11,
  //               fontWeight: FontWeight.w500
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  String _image(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/family_nav_bar.png';
      case 1:
        return 'assets/icons/family_member_nav_bar.png';
      case 2:
        return 'assets/icons/survey_nav_bar.png';
      case 3:
        return 'assets/icons/schemes_nav_bar.png'  ;
      case 4:
        return 'assets/icons/benefits_nav_bar.png';
      default:
        return '';
    }
  }

  String _label(int index) {
    switch (index) {
      case 0:
        return "കുടുംബങ്ങൾ";
      case 1:
        return "അംഗങ്ങൾ";
      case 2:
        return "Survey";
      case 3:
        return "പദ്ധതികൾ";
      case 4:
        return "ആനുകൂല്യങ്ങൾ";
      default:
        return "";
    }
  }
}

