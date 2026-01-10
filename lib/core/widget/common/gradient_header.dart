import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientHeader extends StatelessWidget {
  final String? title;
  final bool showBack;
  final double height;
  final String? backText;
  final VoidCallback? onPress;

  const GradientHeader({
    super.key,
    this.title,
    this.showBack = true,
    this.height = 100,
    this.backText,
    this.onPress,
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
              height: height * 0.5,
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
            left: 8,
            right: 8,
            child: Row(
              children: [
                if (showBack) ...[
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: onPress ,
                  ),
                  if (backText != null)
                    Text(
                      backText!,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  /// 🔹 TITLE
                  if (title != null)
                    Expanded(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],

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
     