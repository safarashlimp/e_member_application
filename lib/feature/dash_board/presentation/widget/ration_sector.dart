import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RationSection extends StatefulWidget {
  final int aayCount;
  final int phhCount;
  final int nphhCount;
  final int npnsCount;

  const RationSection({
    super.key,
    required this.aayCount,
    required this.phhCount,
    required this.nphhCount,
    required this.npnsCount,
  });

  @override
  State<RationSection> createState() => _RationSectionState();
}

class _RationSectionState extends State<RationSection> {
  @override
  Widget build(BuildContext context) {
    final int total =
        widget.aayCount + widget.phhCount + widget.nphhCount + widget.npnsCount;

    double percent(int value) {
      if (total == 0) return 0;
      return (value / total) * 100;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT COLUMN
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: [
                      PieChartSectionData(
                        value: widget.aayCount.toDouble(),
                        color: Colors.amber,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: widget.phhCount.toDouble(),
                        color: Colors.pink,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: widget.nphhCount.toDouble(),
                        color: Colors.blue,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: widget.npnsCount.toDouble(),
                        color: Colors.grey,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LegendItem(
                      color: Colors.amber,
                      label:
                          ' ${percent(widget.aayCount).toStringAsFixed(1)}%'),
                  SizedBox(width: 6.w),
                  _LegendItem(
                      color: Colors.pink,
                      label: '${percent(widget.phhCount).toStringAsFixed(1)}%'),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LegendItem(
                      color: Colors.blue,
                      label:
                          '${percent(widget.nphhCount).toStringAsFixed(1)}%'),
                  SizedBox(width: 6.w),
                  _LegendItem(
                      color: Colors.grey,
                      label:
                          '${percent(widget.npnsCount).toStringAsFixed(1)}%'),
                ],
              ),
            ],
          ),

          SizedBox(width: 6.w),

          /// RIGHT COLUMN
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: _RationCard(
                          imagePath: 'assets/dashboard/rationyellow.png',
                          label: "മഞ്ഞ (AAY)",
                          value: widget.aayCount,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: _RationCard(
                          imagePath: "assets/dashboard/Group 1171275087.png",
                          label: "പിങ്ക് (PHH)",
                          value: widget.phhCount,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: _RationCard(
                          imagePath: "assets/dashboard/Group 1171275088.png",
                          label: "നീല (NPHH)",
                          value: widget.nphhCount,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: _RationCard(
                          imagePath: "assets/dashboard/Group 1171275089.png",
                          label: "വെള്ള (NPNS)",
                          value: widget.npnsCount,
                        ),
                      ),
                    ],
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

class _RationCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final int value;

  const _RationCard({
    required this.imagePath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60.h,
          width: double.infinity,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Text(
            label,
            maxLines: 1,
            //  overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          right: 8.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha((255.0 * 0.15).round()),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(width: 3.w),
        Text(
          label,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
