import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

class AppLabeledField extends StatelessWidget {
  final String label;
  final Widget child;
  final Color labelColor;
  final double labelfontSizes;

  const AppLabeledField({
    super.key,
    required this.label,
    required this.child,
    this.labelColor = AppColor.primary,
    this.labelfontSizes = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // 🔹 Important! Let it wrap content
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: labelfontSizes,
            color: labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
