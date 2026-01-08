// import 'package:e_member_app/core/theme/app_color/app_color.dart';
// import 'package:e_member_app/core/widget/common/gradient_header.dart';
// import 'package:e_member_app/core/widget/common/menu_containar.dart';
// import 'package:flutter/material.dart';

// class ListFamilyMenu extends StatefulWidget {
//   const ListFamilyMenu({super.key});

//   @override
//   State<ListFamilyMenu> createState() => _ListFamilyMenuState();
// }

// class _ListFamilyMenuState extends State<ListFamilyMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         backgroundColor: AppColor.secondary,
//         body: Column(
//           children: [
//             const GradientHeader(backText: 'back'),
//             SizedBox(height: 20),
//             Container(
//               height: 600,
//              // height: double.infinity,
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(9),
//               decoration: BoxDecoration(
                
//                 color: AppColor.secondary,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColor.grey.withOpacity(0.5),
//                     blurRadius: 5,
//                     spreadRadius: 1,
//                   ),
//                 ],
//               ),

//               child: Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Column(
//                   children: [
//                     MenuContainar(
//                       title: 'കുടുംബാംഗത്തിന്റെ വ്യക്തിഗത വിവരം',
//                       iconAsset: 'assets/images/Mask group (16).png',
//                       icon: Icons.navigate_next,
//                       backgroundColor: AppColor.lightBlue,
//                       iconColor: AppColor.iconColor,
//                       titleColor: AppColor.iconColor,

//                     ),
//                     SizedBox(height: 15),
//                     MenuContainar(
//                       title: 'വിദ്യാഭ്യാസം',
//                       iconAsset: 'assets/images/Mask group (17).png',
//                       icon: Icons.navigate_next,
//                       backgroundColor: AppColor.lightgreen,
//                       iconColor: AppColor.green,
//                       titleColor: AppColor.green,  ),
//                       SizedBox(height: 15),
//                     MenuContainar(
//                       title: 'തൊഴിൽ',
//                       iconAsset: 'assets/images/Mask group (22).png',
//                       icon: Icons.navigate_next,
//                       backgroundColor: AppColor.lightOrange,
//                       iconColor: AppColor.orange,
//                       titleColor: AppColor.orange,  ),
//                       SizedBox(height: 15),
//                     MenuContainar(
//                       title: 'ആരോഗ്യം',
//                       iconAsset: 'assets/images/Mask group (20).png',
//                       icon: Icons.navigate_next,
//                       backgroundColor: AppColor.lightRed,
//                       iconColor: AppColor.red,
//                       titleColor: AppColor.red,  ),
//                       SizedBox(height: 15),
//                     MenuContainar(
//                       title: 'സാമൂഹിക  /  ക്ഷേമ വിവരങ്ങൾ',
//                       iconAsset: 'assets/images/Mask group (21).png',
//                       icon: Icons.navigate_next,
//                       backgroundColor: AppColor.lightPurple,
//                       iconColor: AppColor.purple,
//                       titleColor: AppColor.purple,  ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }