import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:flutter/material.dart';

class AppRadioField extends StatelessWidget {
  final String label;
  final int value; // 1 = yes, 0 = no
  final ValueChanged<int> onChanged;
  final Color borderColor;
  final Color focusedBorderColor;
  final double width;
  final double height;

  const AppRadioField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.borderColor = AppColor.borderColor,
    this.focusedBorderColor = AppColor.primary,
    this.width = double.infinity,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: appInputDecoration(
        borderColor: borderColor,
        fillColor: AppColor.white,
        focusedBorderColor: focusedBorderColor,
      ),
      child: Row(
        children: [
          /// LABEL
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColor.hintText2,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// RADIO BUTTONS
          Row(
            children: [
              _radio("ഉണ്ട്", 1),
              _radio("ഇല്ല", 0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radio(String title, int val) {
    return Row(
      children: [
        Radio<int>(
          value: val,
          groupValue: value,
          onChanged: (v) => onChanged(v!),
          activeColor: AppColor.primary,
          visualDensity: VisualDensity.compact,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColor.textLabel,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
