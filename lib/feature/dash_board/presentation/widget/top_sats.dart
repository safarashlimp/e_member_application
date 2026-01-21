// import 'package:flutter/material.dart';

// class TopStats extends StatefulWidget {
//   final int housecount;
//   final  int  familiesCount;
//   final int   memeberscount;
//   const TopStats({super.key,required this.housecount,required this.familiesCount, required this.memeberscount });

//   @override
//   State<TopStats> createState() => _TopStatsState();
// }

// class _TopStatsState extends State<TopStats> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children:  [
//         _StatCard(
//           icon: 'assets/images/home.png',
//           label: 'വീടുകൾ',
//           value : widget.housecount,
//         ),
//         SizedBox(width: 12),
//         _StatCard(
//           icon: 'assets/images/Mask group (25).png',
//           label: 'കുടുംബങ്ങൾ',
//           value: widget.familiesCount,
//         ),
//         SizedBox(width: 12),
//         _StatCard(
//           icon: 'assets/images/Mask group (26).png',
//           label: 'ജനസംഖ്യ',
//           value: widget.memeberscount,
//         ),
//       ],
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String icon;
//   final String label;
//   final int  value;

//   const _StatCard({
//     required this.icon,
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       height: 60,
//       padding: const EdgeInsets.only(left: 5, top: 8, bottom: 8, ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Row(
//         children: [
//            SizedBox(
//             width: 30,
//             height: 30,
//             child: Image.asset(icon, width: 30,height: 30,)),
//           const SizedBox(width: 3),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
        
//               Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.blue,
//                 ),
//               ),
            
//               Text(value.toString(),
//                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
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
//     return Row(
//       children: [
//         Expanded(
//           child: _StatCard(
//             icon: 'assets/images/home.png',
//             label: 'വീടുകൾ',
//             value: widget.housecount,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: _StatCard(
//             icon: 'assets/images/Mask group (25).png',
//             label: 'കുടുംബങ്ങൾ',
//             value: widget.familiesCount,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: _StatCard(
//             icon: 'assets/images/Mask group (26).png',
//             label: 'ജനസംഖ്യ',
//             value: widget.memeberscount,
//           ),
//         ),
//       ],
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
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 30,
//             height: 30,
//             child: Image.asset(icon, fit: BoxFit.contain),
//           ),
//           const SizedBox(width: 4),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   label,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   value.toString(),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: 'assets/images/home.png',
                label: 'വീടുകൾ',
                value: widget.housecount,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                icon: 'assets/images/Mask group (25).png',
                label: 'കുടുംബം',
                value: widget.familiesCount,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                icon: 'assets/images/Mask group (26).png',
                label: 'ജനസംഖ്യ',
                value: widget.memeberscount,
              ),
            ),
          ],
        );
      },
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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive sizes
        final cardHeight = constraints.maxHeight;
        final iconSize = cardHeight * 0.4;
        final labelFontSize = cardHeight * 0.16;
        final valueFontSize = cardHeight * 0.32;
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: Image.asset(icon, fit: BoxFit.contain),
              ),
              const SizedBox(width: 4),
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
                        fontSize: labelFontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: valueFontSize,
                        fontWeight: FontWeight.bold,
color: AppColor.primary
                        
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}