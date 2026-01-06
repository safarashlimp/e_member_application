import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? icon;
  final TextStyle? labelStyle;

  const AppActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 100,
    this.height = 40,
    this.backgroundColor = AppColor.primary,
    this.foregroundColor = AppColor.white,
    this.icon,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        width: double.infinity,

        child: Stack(
          children: [
            Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: AppColor.primaryGradient,
              ),
            ),
            // 🔹 Bottom gradient strip
            Positioned(
              top: height * 0.35,
              bottom: height * 0,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.35,
                width: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  gradient: AppColor.primaryGradientLight,
                ),
              ),
            ),

            // 🔹 Center text
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      label,
                      style:
                          labelStyle ??
                          const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                    ),
                  ),

                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(icon, size: 25, color: AppColor.white),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
