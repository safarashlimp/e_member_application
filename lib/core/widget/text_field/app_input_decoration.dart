import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

InputDecoration appInputDecoration({
  Widget? suffixIcon,
  Color borderColor = AppColor.primary,
  Color focusedBorderColor = AppColor.primary,
  Color fillColor = AppColor.white,
  String? hintText,
  Color hintColor = AppColor.textLabel,
}) {
  final baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: borderColor, width: 1),
  );

  return InputDecoration(
    filled: true,
    fillColor: fillColor,
    hintText: hintText,
    hintStyle: TextStyle(color: hintColor, fontSize: 12),
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

    // NORMAL
    border: baseBorder,
    enabledBorder: baseBorder,
    focusedBorder: baseBorder.copyWith(
      borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
    ),

    // 🔥 OVERRIDE ERROR BORDERS (NO RED)
    errorBorder: baseBorder,
    focusedErrorBorder: baseBorder.copyWith(
      borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
    ),

    // 🔥 HIDE ERROR TEXT & SPACE
    errorStyle: const TextStyle(
      height: 0,
      fontSize: 0,
    ),
  );
}
