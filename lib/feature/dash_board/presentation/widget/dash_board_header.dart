import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardHeader extends StatefulWidget {
  final String? title;
  final bool showBack;
  final double height;
  final String? backText;

  const DashBoardHeader({
    super.key,
    this.title,
    this.showBack = true,
    this.height = 100,
    this.backText,
  });

  @override
  State<DashBoardHeader> createState() => _DashBoardHeaderState();
}

class _DashBoardHeaderState extends State<DashBoardHeader> {
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString(PrefKeys.userName) ?? '';
      ward = prefs.getString(PrefKeys.ward) ?? '';
      photoUrl = prefs.getString(PrefKeys.photo) ?? '';
    });
  }

  String userName = '';
  String ward = '';
  String photoUrl = '';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: [
          /// 🔹 MAIN GRADIENT
          Container(
            height: widget.height.h,
            width: double.infinity,
            decoration: BoxDecoration(gradient: AppColor.primaryGradient),
          ),

          /// 🔹 LIGHT GRADIENT
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: (widget.height * 0.5).h,
              decoration: BoxDecoration(
                gradient: AppColor.primaryGradientLight,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                ),
              ),
            ),
          ),

          Positioned(
            top: (widget.height - 10).h,
            left: 0,
            right: 0,
            child: Container(
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColor.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
            ),
          ),

          /// 🔹 USER INFO
          Positioned(
            top: (widget.height * 0.30).h,
            left: 16.w,
            right: 16.w,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundImage: photoUrl.isNotEmpty
                      ? NetworkImage(photoUrl)
                      : const AssetImage(
                          'assets/images/Ellipse 1216.png',
                        ) as ImageProvider,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userName.isNotEmpty ? userName : 'User',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        ward.isNotEmpty ? 'Ward $ward' : '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color:
                              AppColor.white.withAlpha((255.0 * 0.8).round()),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(Icons.notifications, color: Colors.white, size: 20.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
