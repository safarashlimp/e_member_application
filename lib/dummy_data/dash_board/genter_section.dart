import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

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
                
                

      
              children: const [
                _GenderCard('assets/icons/male.png', 'പുരുഷൻ', '540', AppColor.blue, 12),
                _GenderCard('assets/icons/female.png', 'സ്ത്രീ', '540', AppColor.pink, 12),
                _GenderCard('assets/icons/child.png', 'കുട്ടികൾ', '540', AppColor.naviBlue, 12),
              ],
            ),

            const SizedBox(height: 8),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                

        
              children: const [
                _GenderCard('assets/icons/male.png', 'വയോജനങ്ങൾ', '540', AppColor.orange1, 10),
                _GenderCard('assets/icons/female.png', 'ഭിന്നശേഷിക്കാർ', '540', AppColor.violet,10),
                _GenderCard('assets/icons/child.png', 'കർഷകർ', '540', AppColor.darkGreen,12),
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
  final String value;
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
                Text(value,
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
