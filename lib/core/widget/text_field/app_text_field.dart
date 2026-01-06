import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:e_member_app/core/widget/text_field/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final String type;
  final String? hintText;
  final String? Function(String?)? validator;
  final double width;
  final double height;
  final Color labelColor;
  final Color textColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color hintColor;
  final double labelfontSizes;
  const AppTextField({
    super.key,
    this.label,
    required this.controller,
    this.type = 'text',
    this.hintText,
    this.validator,
    this.width = double.infinity,
    this.height = 40,
    this.labelColor = AppColor.primary,
    this.textColor = AppColor.primary,
    this.borderColor = AppColor.primary,
    this.focusedBorderColor = AppColor.primary,
    this.hintColor = AppColor.textLabel,
    this.labelfontSizes = 12,
  });
  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType = TextInputType.text;
    List<TextInputFormatter> formatters = [];
    int maxLength = 50;

    switch (type) {
      case 'number':
        keyboardType = TextInputType.number;
        formatters = [FilteringTextInputFormatter.digitsOnly];
        maxLength = 6;
        break;
      case 'mobile':
        keyboardType = TextInputType.phone;
        formatters = [FilteringTextInputFormatter.digitsOnly];
        maxLength = 10;
        break;
      case 'house_number':
        keyboardType = TextInputType.text;
        //formatters = [Fi]

        maxLength = 9;
        break;
      case "income":
        keyboardType = TextInputType.number;
        formatters = [FilteringTextInputFormatter.digitsOnly];
        maxLength = 7;
        break;
      case "card_number":
        keyboardType = TextInputType.text;
        formatters = [FilteringTextInputFormatter.digitsOnly];
        maxLength = 12;
        break;
    }
    final field = SizedBox(
      width: width,
      //height: height
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: [
          ...formatters,
          LengthLimitingTextInputFormatter(maxLength),
        ],
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        decoration: appInputDecoration(
          borderColor: borderColor,
          hintText: hintText,
          hintColor: hintColor,
          fillColor: AppColor.white,
        ),
        validator: validator,
      ),
    );

    return label != null
        ? AppLabeledField(
            label: label!,
            labelColor: labelColor,
            labelfontSizes: labelfontSizes,
            child: field,
          )
        : field;
  }
}
