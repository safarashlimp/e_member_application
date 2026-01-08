import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class MenuContainar extends StatelessWidget {
  final String title;
  final String iconAsset;
  //final Widget child;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;
  final Color titleColor;
   final VoidCallback? onIconTap;


  const MenuContainar({
    super.key,
    required this.title,
    required this.iconAsset,
   // required this.child,
    required this.icon,
    this.iconColor = Colors.blue,
    this.iconSize = 40,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
     this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: AppColor.grey.withOpacity(0.2), blurRadius: 5, spreadRadius: 1),
        ],
       
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                       borderRadius: BorderRadius.circular(15),
                      color: backgroundColor,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.asset(
                      iconAsset,
                      width: 35,
                      height: 35,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              
                Flexible(
                  child: SizedBox(
                    width: 223,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              
               GestureDetector(
                onTap: onIconTap,
                child: Icon(icon, size: iconSize, color: iconColor,)),
            ],
          ),
     
  
        ],
      ),
    );
  }
}