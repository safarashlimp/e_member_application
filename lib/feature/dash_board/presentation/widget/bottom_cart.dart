import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class BottomCards extends StatefulWidget {
  final  int  thozhilurapCount;
  final int kudumbasreeCount;
  final int harithakarmasenaCount;
  const BottomCards({super.key,
  
  required this.thozhilurapCount,
  required this.kudumbasreeCount,
  required this.harithakarmasenaCount
  });

  @override
  State<BottomCards> createState() => _BottomCardsState();
}

class _BottomCardsState extends State<BottomCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            //  mainAxisAlignment: MainAxisAlignment,
            children:  [
              Expanded(
                child: BottomSummeryCart(
                  bagroundColor: AppColor.orange1,
                  lebel:  "തൊഴിലുറപ്പ്",
                  value: widget.thozhilurapCount,
                   iconurl: "assets/dashboard/icons/avatar-design 1.png",
                   fontSize: 12,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: BottomSummeryCart(
                  bagroundColor: AppColor.violet,
                  lebel: "കുടുംബശ്രീ",
                  value:  widget.kudumbasreeCount,
                  iconurl: "assets/dashboard/icons/businesswoman 1.png",
                  fontSize: 12,
                  // imagePath: 'assets/images/Group 1171275033.png',
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: BottomSummeryCart(
                  value: widget.harithakarmasenaCount,
                  lebel: "ഹരിതകർമ്മസേന",
                  bagroundColor: AppColor.green,
                  iconurl: "assets/dashboard/icons/harithakarmasena.png",
                  fontSize: 10,
                  // imagePath: 'assets/images/Group 1171275060.png',
                ),
              ),
            ],
          ),
          // const SizedBox(height: ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _MiniCard(
                'assets/images/Mask group (27).png',
                'പോസ്റ്റർ നിർമാണം',
              ),
              _MiniCard('assets/images/Mask group (28).png', 'ഫോൺ ഡയറക്ടറി'),
              _MiniCard('assets/images/Mask group (29).png', 'ബ്ലഡ് ബാങ്ക്'),
              _MiniCard('assets/images/Mask group (30).png', 'പദ്ധതികൾ'),
              _MiniCard('assets/images/Mask group (31).png','സർക്കാർ സേവനങ്ങൾ'),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String icon;
  final String value;

  const _MiniCard(this.icon, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      height: 65,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(icon, height: 20, width: 22),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BottomSummeryCart extends StatelessWidget {

//  final Color bagroundColor;
//  final String  lebel;
//  final int value;
//   final String iconurl;
//   final int? fontSize;

//  const   BottomSummeryCart({super.key,
//  this.fontSize,
//  required this.lebel,
//   required this.bagroundColor,
//   required this.value,
//   required this.iconurl
//    });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       height: 55,
//       padding:  EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//         color: bagroundColor  ,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Row(
         
//         children: [
//            SizedBox(
//             height: 30,
//             width: 30,
//             child:
//              Image.asset(iconurl, fit: BoxFit.contain)),
//           const SizedBox(width: 3),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                   Text( lebel,
//                         maxLines: 2,               // allows wrapping
//                 overflow: TextOverflow.visible,
//                    style: TextStyle(color: AppColor.white,fontSize: fontSize ,fontWeight: FontWeight.w500)),
//                 //const SizedBox(height: 2),
//                 Text(value.toString(),
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600)),
                     
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BottomSummeryCart extends StatelessWidget {
  final Color bagroundColor;
  final String lebel;
  final int value;
  final String iconurl;
  final double fontSize;

  const BottomSummeryCart({
    super.key,
   required this.fontSize,
    required this.lebel,
    required this.bagroundColor,
    required this.value,
    required this.iconurl,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 58, // ✅ safe minimum
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        decoration: BoxDecoration(
          color: bagroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(iconurl, fit: BoxFit.contain),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, // ✅ VERY IMPORTANT
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lebel,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // ✅ prevents overflow
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: fontSize , // ✅ fallback
                      fontWeight: FontWeight.w500,
                      height: 1.1, // ✅ line height control
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15, // slightly reduced
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
