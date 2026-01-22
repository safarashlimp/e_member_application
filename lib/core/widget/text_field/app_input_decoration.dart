import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

// InputDecoration appInputDecoration({
//   Widget? suffixIcon,
//   Color borderColor = AppColor.primary,
//   Color focusedBorderColor = AppColor.primary,
//   Color fillColor = AppColor.transparent,
//   String? hintText,
//   Color hintColor = AppColor.textLabel,
//   String? helperText,
// }) {
//   final baseBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10),
//     borderSide: BorderSide(color: borderColor, width: 1),
//   );
//   return InputDecoration(
//     filled: true,
//     fillColor: fillColor,
//     hintText: hintText,
//     hintStyle: TextStyle(color: hintColor, fontSize: 12),
//     suffixIcon: suffixIcon,
//     contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     border: baseBorder,
//     enabledBorder: baseBorder,
//     focusedBorder: baseBorder.copyWith(
//       borderSide: BorderSide(color: focusedBorderColor, width: 2),
//     ),

//     errorStyle: const TextStyle(height: 0, fontSize: 0),
//     helperText: helperText,
//   );
// }
InputDecoration appInputDecoration({
  Widget? suffixIcon,
  Color borderColor = AppColor.primary,
  Color focusedBorderColor = AppColor.primary,
  Color errorBorderColor = Colors.red,
  Color fillColor = AppColor.transparent,
  String? hintText,
  Color hintColor = AppColor.textLabel,
  String? helperText,
  String? errorText, // ✅ ADD THIS
}) {
  final baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: borderColor, width: 1),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: errorBorderColor, width: 1.5),
  );

  return InputDecoration(
    filled: true,
    fillColor: fillColor,
    hintText: hintText,
    hintStyle: TextStyle(color: hintColor, fontSize: 12),
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

    border: baseBorder,
    enabledBorder: baseBorder,
    focusedBorder: baseBorder.copyWith(
      borderSide: BorderSide(color: focusedBorderColor, width: 2),
    ),

    // ✅ ERROR HANDLING
 // 🔴 ERROR BORDER ONLY — NO TEXT
  errorText: errorText,
  errorStyle: const TextStyle(
    height: 0,
    fontSize: 0,
  ),
  errorBorder: errorBorder,
  focusedErrorBorder: errorBorder,

    helperText: helperText,
  );
}
