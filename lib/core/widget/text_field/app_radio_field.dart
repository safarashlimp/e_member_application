import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:e_member_app/core/theme/app_color/app_color.dart';

class AppRadioField extends StatelessWidget {
  final String label;
  final String value;
  final Function(String) onChanged;
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
        borderColor: AppColor.borderColor,
        fillColor: AppColor.white,
        focusedBorderColor: AppColor.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// 🔹 LABEL INSIDE FIELD
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: AppColor.hintText2,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// 🔹 RADIO BUTTONS
          Row(
            mainAxisAlignment: .end,
            children: [
              _radio("ഉണ്ട്", "yes"),
              //const SizedBox(width: ),
              _radio("ഇല്ല", "no"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radio(String title, String val) {
    return Row(
      children: [
        Radio<String>(
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
