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
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomLastSummeryCart(imagePath: 'assets/images/Group 1171275066.png'),
              BottomLastSummeryCart(imagePath: 'assets/images/Group 1171275067.png'),
              BottomLastSummeryCart(imagePath: 'assets/images/Group 1171275072.png'),
               BottomLastSummeryCart(imagePath: 'assets/images/Group 1171275069 (1).png'),
              BottomLastSummeryCart(imagePath: 'assets/images/Group 1171275069.png'),
             
            ],
          )
        ],
      ),
    );
  }
}
// class _MiniCard extends StatelessWidget {
//   final String icon;
//   final String value;

//   const _MiniCard(this.icon, this.value);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           Image.asset(icon, height: 28),
//           const SizedBox(height: 8),
//           Text(value,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }


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
class BottomLastSummeryCart extends StatelessWidget {
  final String imagePath;
  const BottomLastSummeryCart({super.key , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 70,
      height: 70,
     // padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(12),
      ),
     child: Image.asset(imagePath)  );
  }
  }