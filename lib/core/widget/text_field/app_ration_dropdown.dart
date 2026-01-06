import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:e_member_app/dummy_data/rationcard.dart';

class AppRationDropdown<T> extends StatelessWidget {
  final String? label;

  // ✅ exactly as you want
  final int? value;
  final List<RationCard> items;
  final ValueChanged<int?> onChanged;
  final Color Function(int) colorBuilder;

  final String? hintText;

  // styling fields (same as AppDropdownField)
  final Color labelColor;
  final Color borderColor;
  final Color iconColor;
  final Color dropdownBgColor;
  final Color dropdownTextColor;
  final Color selectedTextColor;
  final String? Function(T?)? validator;

  const AppRationDropdown({
    super.key,
    this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.colorBuilder,
    this.hintText,
    this.validator,
    this.labelColor = AppColor.primary,
    this.borderColor = AppColor.primary,
    this.iconColor = AppColor.primary,
    this.dropdownBgColor = AppColor.white,
    this.dropdownTextColor = AppColor.textLabel,
    this.selectedTextColor = AppColor.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Label ABOVE field
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: labelColor,
            ),
          ),

        // ✅ Same size as AppDropdownField
        Container(
          height: 46,
          //padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: dropdownBgColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: value,
              isExpanded: true,
              hint: hintText != null
                  ? Text(
                      hintText!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.hintText2,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : null,
              icon: Icon(Icons.arrow_drop_down, color: iconColor),
              items: items.map((item) {
                return DropdownMenuItem<int>(
                  value: item.id,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: colorBuilder(item.id),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: dropdownTextColor,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
