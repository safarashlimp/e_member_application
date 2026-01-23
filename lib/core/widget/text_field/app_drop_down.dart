import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:e_member_app/core/widget/text_field/label_text.dart';
import 'package:flutter/material.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String? label;
  final T? selectedValue;
  final List<T> items;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final String? hintText;
  final double width;
  final double height;
  //final String? errorText;
  // Colors
  final Color labelColor;
  final Color borderColor;
  final Color iconColor;
  final Color dropdownBgColor;
  final Color dropdownTextColor;
  final Color selectedTextColor;

  const AppDropdownField({
    super.key,
    this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.validator,
    this.hintText,
     // this.errorText, 
    this.width = double.infinity,
    this.height = 40,
    this.labelColor = AppColor.primary,
    this.borderColor = AppColor.primary,
    this.iconColor = AppColor.primary,
    this.dropdownBgColor = AppColor.white,
    this.dropdownTextColor = AppColor.primary,
    this.selectedTextColor = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    final dropdown = DropdownButtonFormField<T>(
      
      initialValue: selectedValue,
      isExpanded: true,
      items: items
          .map(
            (e) => DropdownMenuItem<T>(
              value: e,
              child: Text(
                e.toString(),
                maxLines: 1, // ✅ limit to one line
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(color: dropdownTextColor, fontSize: 14),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: appInputDecoration(
        borderColor: borderColor,
        hintText: hintText,
        focusedBorderColor: AppColor.borderColor,
        //  errorText: errorText,
      ),
      validator: validator ,
      dropdownColor: dropdownBgColor,
      icon: Icon(Icons.arrow_drop_down, color: iconColor),

      // 👇 Selected item style
      selectedItemBuilder: (context) {
        return items.map((e) {
          return Text(
            e.toString(),
            style: TextStyle(color: selectedTextColor, fontSize: 14),
          );
        }).toList();
      },
    );

    return label != null
        ? AppLabeledField(
            label: label!,
            labelColor: labelColor,
            child: dropdown,
          )
        : dropdown;
  }
}
