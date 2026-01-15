import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashBoardHeader extends StatelessWidget {
  final String? title;
  final bool showBack;
  final double height;
  final String? backText;

  const DashBoardHeader({
    super.key,
    this.title,
    this.showBack = true,
    this.height = 100,
    this.backText,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: [
          /// 🔹 MAIN GRADIENT
          Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(gradient: AppColor.primaryGradient),
          ),

          /// 🔹 LIGHT GRADIENT
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.5  ,
              decoration: BoxDecoration(
                gradient: AppColor.primaryGradientLight,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                ),
              ),
            ),
          ),

          /// 🔹 WHITE OVERLAP
          Positioned(
            top: height - 10,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: AppColor.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
          ),

          /// 🔹 BACK + TITLE (SAME LINE, SAME POSITION)
          Positioned(
            top: height * 0.30, // 🎯 exact partition point
            left: 16,
            right: 16,
            child: Row(
              children: [
                     
                      const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/Ellipse 1216.png',
            
            ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 260,

                        child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      
                                    children: [
                                      const Text(
                                        'രാഗേഷ് കുമാർ',
                                        style: TextStyle(
                                          color:AppColor.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        'Ward 12 – Green Valley',
                                        style: TextStyle(color: AppColor.white.withOpacity(0.8), fontSize: 12,fontWeight: FontWeight.w500),
                                      ),
                                    ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.notifications, color: Colors.white, size: 20,),
                
                /// 🔹 BALANCE RIGHT SIDE
                // if (showBack) const SizedBox(width: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}