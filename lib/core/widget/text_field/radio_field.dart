import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:e_member_app/core/widget/text_field/label_text.dart';
import 'package:flutter/material.dart';

class AppRadioButtonField extends StatelessWidget {
  final String label;
  final String? value;
  final List<Map<String, String>> options;
  final ValueChanged<String> onChanged;

  /// 🔹 NEW
  final double width;
  final EdgeInsets contentPadding;

  const AppRadioButtonField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.width = double.infinity,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AppLabeledField(
      label: label,
      labelColor: AppColor.hintText2,
      child: SizedBox(
        width: width, // ✅ control width
        child: InputDecorator(
          decoration:
              appInputDecoration(
                borderColor: AppColor.borderColor,
                focusedBorderColor: AppColor.primary,
                fillColor: AppColor.white,
              ).copyWith(
                contentPadding: contentPadding, // ✅ control height
              ),
          child: Wrap(
            spacing: 16,
            runSpacing: 4,
            children: options.map((option) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<String>(
                    materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // 🔹 tighter height
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    value: option['value']!,
                    groupValue: value,
                    activeColor: AppColor.primary,
                    onChanged: (v) => onChanged(v!),
                  ),
                  Text(
                    option['label']!,
                    style: const TextStyle(
                      color: AppColor.textLabel2,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
