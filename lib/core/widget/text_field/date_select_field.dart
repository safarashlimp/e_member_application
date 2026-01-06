import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:e_member_app/core/widget/text_field/label_text.dart';
import 'package:flutter/material.dart';

class AppDateField extends StatelessWidget {
  final BuildContext context;
  final String label;
  final TextEditingController controller;
  final Color labelColor;
  final Color textColor;
  final Color borderColor;
  final Color iconColor;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AppDateField({
    super.key,
    required this.context,
    required this.label,
    required this.controller,
    this.labelColor = AppColor.white,
    this.textColor = AppColor.white,
    this.borderColor = AppColor.white,
    this.iconColor = AppColor.white,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext _) {
    return AppLabeledField(
      label: label,
      labelColor: labelColor,
      child: TextFormField(
        controller: controller,
        readOnly: true,
        style: TextStyle(color: textColor, fontSize: 14),
        validator: validator ?? Validator.validateDate,
        decoration: appInputDecoration(
          suffixIcon:
              suffixIcon ??
              Icon(Icons.calendar_month, color: iconColor, size: 18),
          borderColor: borderColor,
        ),
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColor.primary,
                  colorScheme: const ColorScheme.light(
                    primary: AppColor.primary,
                    onPrimary: AppColor.white,
                    onSurface: AppColor.primary,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.primary,
                    ),
                  ),
                  dialogTheme: DialogThemeData(backgroundColor: AppColor.white),
                ),
                child: child!,
              );
            },
          );

          if (pickedDate != null) {
            controller.text =
                "${pickedDate.day.toString().padLeft(2, '0')}-"
                "${pickedDate.month.toString().padLeft(2, '0')}-"
                "${pickedDate.year}";
          }
        },
      ),
    );
  }
}
