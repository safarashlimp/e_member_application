import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class GenderSection extends StatefulWidget {
  final int maleCount;
  final int femaleCount;
  final int  childrenCount;
  final int elderlyCount;
  final int disabledCount;
  final int farmersCount;
  const GenderSection({super.key,
  required this.maleCount,
  required this.femaleCount,
  required this.childrenCount,
  required  this.elderlyCount,
  required this.disabledCount,
  required this.farmersCount

  });

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
      
         padding: const EdgeInsets.only(left: 5, top: 8, bottom: 8, ),
      decoration: BoxDecoration(
        color: AppColor.white,
       // borderRadius: BorderRadius.circular(14),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ജനസംഖ്യ അവലോകനം',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: AppColor.black),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                

      
              children: [
                _GenderCard('assets/images/avatar-design 1.png', 'പുരുഷൻ', widget.maleCount , AppColor.blue, 12),
                _GenderCard('assets/images/businesswoman 1.png', 'സ്ത്രീ', widget.femaleCount, AppColor.pink, 12),
                _GenderCard('assets/images/people 1.png', 'കുട്ടികൾ', widget.childrenCount, AppColor.naviBlue, 12),
              ],
            ),

            const SizedBox(height: 8),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                

        
              children:  [
                _GenderCard('assets/images/avatar 1.png', 'വയോജനങ്ങൾ', widget.elderlyCount, AppColor.orange1, 10),
                _GenderCard('assets/images/disabled-person 1.png', 'ഭിന്നശേഷിക്കാർ', widget.disabledCount, AppColor.violet,10),
                _GenderCard('assets/images/farmer 1.png', 'കർഷകർ', widget.farmersCount, AppColor.darkGreen,12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _GenderCard extends StatelessWidget {
  final String icon;
  final String label;
  final int value;
  final Color color;
  final double fontSizes  ;

  const _GenderCard(this.icon, this.label, this.value, this.color, this.fontSizes);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
         
        children: [
           SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(icon, fit: BoxFit.contain)),
          const SizedBox(width: 3),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(label,
                        maxLines: 2,               // allows wrapping
                overflow: TextOverflow.visible,
                   style: TextStyle(color: AppColor.white,fontSize: fontSizes,fontWeight: FontWeight.w500)),
                //const SizedBox(height: 2),
                Text(value.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                     
              ],
            ),
          ),
        ],
      ),
    );
  }
}