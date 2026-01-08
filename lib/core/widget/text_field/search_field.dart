import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/text_field/app_input_decoration.dart';
import 'package:flutter/material.dart';

class SearchFieldBar extends StatelessWidget {
  final Function(String)? onChanged;
  final VoidCallback? onFilterTap;
  final String? hintText;

  const SearchFieldBar({
    super.key,
    this.onChanged,
    this.onFilterTap,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 10,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          decoration:
              appInputDecoration(
                hintText: hintText ?? '',
                hintColor: AppColor.grey2,
                borderColor: Colors.transparent,
                focusedBorderColor: Colors.transparent,
                fillColor: Colors.transparent,
                suffixIcon: GestureDetector(
                  onTap: onFilterTap,

                  child: Container(
                    height: 24,
                    width: 24,
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: AppColor.white1,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/icons/ion_filter.png',
                      color: Colors.black,
                      fit: BoxFit.fill,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              ).copyWith(
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColor.button,
                  size: 24,
                ),
                // contentPadding: const EdgeInsets.only( top: 13, left: 12, bottom: 13,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
        ),
      ),
    );
  }
}
