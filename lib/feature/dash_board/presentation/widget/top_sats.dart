import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopStats extends StatefulWidget {
  final int housecount;
  final int familiesCount;
  final int memeberscount;
  const TopStats({
    super.key,
    required this.housecount,
    required this.familiesCount,
    required this.memeberscount,
  });

  @override
  State<TopStats> createState() => _TopStatsState();
}

class _TopStatsState extends State<TopStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: 'assets/images/home.png',
            label: 'വീടുകൾ',
            value: widget.housecount,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatCard(
            icon: 'assets/images/Mask group (25).png',
            label: 'കുടുംബങ്ങൾ',
            value: widget.familiesCount,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatCard(
            icon: 'assets/images/Mask group (26).png',
            label: 'ജനസംഖ്യ',
            value: widget.memeberscount,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String label;
  final int value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h, // 👈 Fixed height
      width: 110.w, // 👈 Fixed width
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: Image.asset(icon, fit: BoxFit.contain),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                //SizedBox(height: 2.h),
                Text(
                  value.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
