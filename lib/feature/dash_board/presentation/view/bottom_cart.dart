import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class BottomCards extends StatefulWidget {
  const BottomCards({super.key});

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
            children: const [
              BottomSummeryCart(imagePath: 'assets/images/Group 1171275032.png'),
              BottomSummeryCart(imagePath: 'assets/images/Group 1171275033.png'),
              BottomSummeryCart(imagePath: 'assets/images/Group 1171275060.png'),
             
            ],
          ),
         // const SizedBox(height: ),
           Row(
           // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _MiniCard('assets/images/Mask group (27).png', 'പോസ്റ്റർ നിർമാണം'),
              _MiniCard('assets/images/Mask group (28).png', 'ഫോൺ ഡയറക്ടറി'),
              _MiniCard('assets/images/Mask group (29).png', 'ബ്ലഡ് ബാങ്ക്'),
              _MiniCard('assets/images/Mask group (30).png', 'പദ്ധതികൾ'),
              _MiniCard('assets/images/Mask group (31).png', 'സർക്കാർ സേവനങ്ങൾ'),
            ],
          )
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
        color:AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: .start ,
        children: [
          Image.asset(icon, height: 20, width: 22),
          const SizedBox(height: 4),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,fontSize: 8)),
          ),
        ],
      ),
    );
  }
}


class BottomSummeryCart extends StatelessWidget {
  final String imagePath;
  const BottomSummeryCart({super.key , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 115,
      height: 60,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(12),
      ),
     child: Image.asset(imagePath)  );
  }
  }
// class BottomLastSummeryCart extends StatelessWidget {
//   final String imagePath;
//   const BottomLastSummeryCart({super.key , required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 65,
//       height: 70,
//      // padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//       color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//      child: Image.asset(imagePath)  );
//   }
//   }