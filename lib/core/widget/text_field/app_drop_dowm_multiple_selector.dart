import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:e_member_app/core/widget/text_field/label_text.dart';
import 'package:flutter/material.dart';
class AppMultiSelectDropdown<T> extends StatelessWidget {
  final String? label;
  final List<T> items;
  final List<T> selectedValues;
  final Function(List<T>) onChanged;
  final String? hintText;

  final Color labelColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  const AppMultiSelectDropdown({
    super.key,
    this.label,
    required this.items,
    required this.selectedValues,
    required this.onChanged,
    this.hintText,
    this.labelColor = AppColor.hintText2,
    this.borderColor = AppColor.borderColor,
    this.iconColor = AppColor.black,
    this.textColor = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    // 👇 THIS is the dropdown field text
    final String displayText = selectedValues.isNotEmpty
        ? selectedValues.map((e) => e.toString()).join(', ')
        : (hintText ?? '');

    final dropdownField = InkWell(
      onTap: () => _openMultiSelect(context),
      child: InputDecorator(
        decoration: appInputDecoration(
          borderColor: borderColor,
          hintText: hintText,
          suffixIcon: Icon(Icons.arrow_drop_down, color: iconColor),
        ),
        child: Text(
          displayText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, 
          style: TextStyle(
            color: displayText.isEmpty
                ? Colors.grey
                : textColor,
            fontSize: 14,
          ),
        ),
      ),
    );

    return label != null
        ? AppLabeledField(
            label: label!,
            labelColor: labelColor,
            child: dropdownField,
          )
        : dropdownField;
  }

  void _openMultiSelect(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        final tempSelected = List<T>.from(selectedValues);

   return StatefulBuilder(
    builder:(context, setState) {

      return AlertDialog(
       backgroundColor: AppColor.white,
       shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
       ),
     
       title: Text(
      label ?? 'Select',
      style: const TextStyle(
        color: AppColor.textLabel2,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
       ),
     
       content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          return CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
     
            activeColor: AppColor.primary,
            checkColor: AppColor.white,
     
            value: tempSelected.contains(item),
            title: Text(
              item.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColor.textLabel2,
              ),
            ),
           onChanged: (checked) {
       setState(() { 
       if (checked == true) {
      if (!tempSelected.contains(item)) {
        tempSelected.add(item); 
      }
       } else {
      tempSelected.remove(item);
       
       }
      });
     },
     
          );
        }).toList(),
      ),
       ),
     
       actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
     
       actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text(
          'CANCEL',
          style: TextStyle(
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.button,
          foregroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          onChanged(tempSelected);
          Navigator.pop(context);
        },
        child: const Text(
          'OK',
          style: TextStyle(fontWeight: FontWeight.w600,),
        ),
      ),
       ],
     );
      }
   );

      },
    );
  }
}
