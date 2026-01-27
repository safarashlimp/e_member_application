import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double height;
  final IconData? icon;
  final TextStyle? labelStyle;

  const AppActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 40,
    this.icon,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: AppColor.primaryGradient,
          ),
          child: Stack(
            children: [
              Positioned(
                top: height * 0.45,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(8)),
                    gradient: AppColor.primaryGradientLight,
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: labelStyle ??
                          const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                    ),
                    if (icon != null) ...[
                      const SizedBox(width: 8),
                      Icon(icon, size: 20, color: AppColor.white),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
