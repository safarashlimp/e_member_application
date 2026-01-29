import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomCards extends StatelessWidget {
  final int thozhilurapCount;
  final int kudumbasreeCount;
  final int harithakarmasenaCount;

  const BottomCards({
    super.key,
    required this.thozhilurapCount,
    required this.kudumbasreeCount,
    required this.harithakarmasenaCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 64.h,
                  child: BottomSummaryCard(
                    label: "തൊഴിലുറപ്പ്",
                    value: thozhilurapCount,
                    backgroundColor: AppColor.orange1,
                    icon: "assets/dashboard/icons/avatar-design 1.png",
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: SizedBox(
                  height: 64.h,
                  child: BottomSummaryCard(
                    label: "കുടുംബശ്രീ",
                    value: kudumbasreeCount,
                    backgroundColor: AppColor.violet,
                    icon: "assets/dashboard/icons/businesswoman 1.png",
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: SizedBox(
                  height: 64.h,
                  child: BottomSummaryCard(
                    label: "ഹരിതകർമ്മസേന",
                    value: harithakarmasenaCount,
                    backgroundColor: AppColor.green,
                    icon: "assets/dashboard/icons/harithakarmasena.png",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: const [
              MiniCard(
                icon: 'assets/images/Mask group (27).png',
                title: 'പോസ്റ്റർ നിർമാണം',
              ),
              SizedBox(width: 4,),
              MiniCard(
                icon: 'assets/images/Mask group (28).png',
                title: 'ഫോൺ ഡയറക്ടറി',
              ),
              SizedBox(width: 4,),
              MiniCard(
                icon: 'assets/images/Mask group (29).png',
                title: 'ബ്ലഡ് ബാങ്ക്',
              ),
               SizedBox(width: 4,),
              MiniCard(
                icon: 'assets/images/Mask group (30).png',
                title: 'പദ്ധതികൾ',
              ),
               SizedBox(width: 4,),
              Expanded(
                child: MiniCard(
                  icon: 'assets/images/Mask group (31).png',
                  title: 'സർക്കാർ സേവനങ്ങൾ',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniCard extends StatelessWidget {
  final String icon;
  final String title;

  const MiniCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 67.w,
      child: Container(
       // margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 6.w , vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Image.asset(
              icon,
              height: 22.h,
              width: 22.w,
              fit: BoxFit.contain,
            ),
           //SizedBox(height: 6.h),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
                height: 1.25
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BottomSummaryCard extends StatelessWidget {
  final String label;
  final int value;
  final Color backgroundColor;
  final String icon;

  const BottomSummaryCard({
    super.key,
    required this.label,
    required this.value,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55, // ✅ Same as _GenderCard
      width: 110, // ✅ Same as _GenderCard
      child: Container(
        padding: const EdgeInsets.all(6.0), // ✅ Same as _GenderCard
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14), // ✅ Same as _GenderCard
        ),
        child: Row(
          children: [
            SizedBox(
              height: 26, // ✅ Same icon size as _GenderCard
              width: 26,  // ✅ Same icon size as _GenderCard
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 6), // ✅ Same spacing as _GenderCard
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10, // ✅ Match _GenderCard default font size
                      fontWeight: FontWeight.w500,
                      height: 1.1, // ✅ Same line height as _GenderCard
                    ),
                  ),
                  Text(
                    value.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14, // ✅ Same value font size as _GenderCard
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}