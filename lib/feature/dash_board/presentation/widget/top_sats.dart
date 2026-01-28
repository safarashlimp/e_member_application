
// import 'package:e_member_app/core/theme/app_color/app_color.dart';
// import 'package:flutter/material.dart';

// class TopStats extends StatefulWidget {
//   final int housecount;
//   final int familiesCount;
//   final int memeberscount;
//   const TopStats({
//     super.key,
//     required this.housecount,
//     required this.familiesCount,
//     required this.memeberscount,
//   });

//   @override
//   State<TopStats> createState() => _TopStatsState();
// }

// class _TopStatsState extends State<TopStats> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Row(
//           children: [
//             Expanded(
//               child: _StatCard(
//                 icon: 'assets/images/home.png',
//                 label: 'വീടുകൾ',
//                 value: widget.housecount,
//               ),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: _StatCard(
//                 icon: 'assets/images/Mask group (25).png',
//                 label: 'കുടുംബം',
//                 value: widget.familiesCount,
//               ),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: _StatCard(
//                 icon: 'assets/images/Mask group (26).png',
//                 label: 'ജനസംഖ്യ',
//                 value: widget.memeberscount,
//               ),
//             ),
//           ],
//         );  
//       },
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String icon;
//   final String label;
//   final int value;

//   const _StatCard({
//     required this.icon,
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Calculate responsive sizes
//         final cardHeight = constraints.maxHeight;
//         final iconSize = cardHeight * 0.4;
//         final labelFontSize = cardHeight * 0.16;
//         final valueFontSize = cardHeight * 0.32;
        
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Row(
//             children: [
//               SizedBox(
//                 width: iconSize,
//                 height: iconSize,
//                 child: Image.asset(icon, fit: BoxFit.contain),
//               ),
//               const SizedBox(width: 4),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       label,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: labelFontSize,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Text(
//                       value.toString(),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: valueFontSize,
//                         fontWeight: FontWeight.bold,
// color: AppColor.primary
                        
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopStats extends StatefulWidget {
  final int housecount;
  final int familiesCount;
  final int memeberscount;
  const TopStats({
    super.key,
    required this.housecount,
    required this.familiesCount,
    required this.memeberscount,
  });

  @override
  State<TopStats> createState() => _TopStatsState();
}

class _TopStatsState extends State<TopStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: 'assets/images/home.png',
            label: 'വീടുകൾ',
            value: widget.housecount,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatCard(
            icon: 'assets/images/Mask group (25).png',
            label: 'കുടുംബം',
            value: widget.familiesCount,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatCard(
            icon: 'assets/images/Mask group (26).png',
            label: 'ജനസംഖ്യ',
            value: widget.memeberscount,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String label;
  final int value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 60.h, // 👈 Fixed height
      width: 110.w,  // 👈 Fixed width
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 28.w,
            height: 28.h,
            child: Image.asset(icon, fit: BoxFit.contain),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}