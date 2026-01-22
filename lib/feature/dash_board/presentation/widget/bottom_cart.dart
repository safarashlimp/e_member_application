
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          /// ================= TOP SUMMARY CARDS =================
          Row(
  children: [
    Expanded(
      child: SizedBox(
        height: 64, // 👈 same height for all
        child: BottomSummaryCard(
          label: "തൊഴിലുറപ്പ്",
          value: thozhilurapCount,
          backgroundColor: AppColor.orange1,
          icon: "assets/dashboard/icons/avatar-design 1.png",
        ),
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: SizedBox(
        height: 64,
        child: BottomSummaryCard(
          label: "കുടുംബശ്രീ",
          value: kudumbasreeCount,
          backgroundColor: AppColor.violet,
          icon: "assets/dashboard/icons/businesswoman 1.png",
        ),
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: SizedBox(
        height: 64,
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

    
      SizedBox(height: 6,),

          /// ================= MINI ACTION CARDS =================
          Row(
            children: const [
              MiniCard(
                icon: 'assets/images/Mask group (27).png',
                title: 'പോസ്റ്റർ നിർമാണം',
              ),
              MiniCard(
                icon: 'assets/images/Mask group (28).png',
                title: 'ഫോൺ ഡയറക്ടറി',
              ),
              MiniCard(
                icon: 'assets/images/Mask group (29).png',
                title: 'ബ്ലഡ് ബാങ്ക്',
              ),
              MiniCard(
                icon: 'assets/images/Mask group (30).png',
                title: 'പദ്ധതികൾ',
              ),
              MiniCard(
                icon: 'assets/images/Mask group (31).png',
                title: 'സർക്കാർ സേവനങ്ങൾ',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///// ===================== MINI CARD =====================
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
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final iconSize = constraints.maxWidth * 0.35;
          final fontSize = constraints.maxWidth * 0.14;

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  height: iconSize,
                  width: iconSize,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          );
        },
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth * 0.22;
        final titleSize = constraints.maxWidth * 0.08;
        final valueSize = constraints.maxWidth * 0.12;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: iconSize,
                width: iconSize,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // ⭐ IMPORTANT
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: valueSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}