// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class RationSection extends StatefulWidget {
//   final int aayCount;
//   final int phhCount;
//   final int nphhCount;
//   final int npnsCount;

//   const RationSection({
//     super.key,
//     required this.aayCount,
//     required this.phhCount,
//     required this.nphhCount,
//     required this.npnsCount,
//   });

//   @override
//   State<RationSection> createState() => _RationSectionState();
// }

// class _RationSectionState extends State<RationSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// LEFT COLUMN
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: PieChart(
//                     PieChartData(
//                       sectionsSpace: 0,
//                       centerSpaceRadius: 0,
//                       sections: [
//                         PieChartSectionData(value: 152, color: Colors.amber, showTitle: false),
//                         PieChartSectionData(value: 100, color: Colors.pink, showTitle: false),
//                         PieChartSectionData(value: 180, color: Colors.blue, showTitle: false),
//                         PieChartSectionData(value: 80, color: Colors.grey, showTitle: false),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     _LegendItem(color: Colors.amber, label: '80%'),
//                     SizedBox(width: 10),
//                     _LegendItem(color: Colors.pink, label: '80%'),
//                   ],
//                 ),
//                 const SizedBox(height: 6), // ✅ FIXED (was width)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     _LegendItem(color: Colors.blue, label: '80%'),
//                     SizedBox(width: 10),
//                     _LegendItem(color: Colors.grey, label: '80%'),
//                   ],
//                 ),
//               ],
//             ),

//             const SizedBox(width: 6),

//             /// RIGHT COLUMN
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _RationCard(
//                         imagePath: 'assets/dashboard/raionYellow.png',
//                         label: "മഞ്ഞ (AAY)",
//                         value: widget.aayCount,
//                       ),
//                       _RationCard(
//                         imagePath: "assets/dashboard/raionPink.png",
//                         label: "പിങ്ക് (PHH)",
//                         value: widget.phhCount,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _RationCard(
//                         imagePath: "assets/dashboard/raionBlue.png",
//                         label: "നീല (NPHH)",
//                         value: widget.nphhCount,
//                       ),
//                       _RationCard(
//                         imagePath: "assets/dashboard/rationWhite.png",
//                         label: "വെള്ള (NPNS)",
//                         value: widget.npnsCount,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ================= CARD =================
// class _RationCard extends StatelessWidget {
//   final String imagePath;
//   final String label;
//   final int value;

//   const _RationCard({
//     required this.imagePath,
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(
//         maxWidth: 105,
//         minHeight: 56, // ✅ safe minimum
//       ),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(imagePath, width: 26, height: 26),
//             const SizedBox(width: 6),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min, // ✅ VERY IMPORTANT
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     label,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 6,
//                       vertical: 2,
//                     ), // ✅ reduced padding
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFFE8A1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       value.toString(),
//                       style: const TextStyle(
//                         fontSize: 14, // ✅ slightly reduced
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// /// ================= LEGEND =================
// class _LegendItem extends StatelessWidget {
//   final Color color;
//   final String label;

//   const _LegendItem({
//     required this.color,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(2),
//           ),
//         ),
//         const SizedBox(width: 4),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }

import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
   final  int total  =     widget.aayCount +
    widget.phhCount +
    widget.nphhCount +
    widget.npnsCount;
double percent(int value) {
  if (total == 0) return 0;
  return (value / total) * 100;
}

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final chartSize = constraints.maxHeight * 0.65;
          
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
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
                      height: chartSize,
                      width: chartSize,
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
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        _LegendItem(color: Colors.amber, label: ' ${percent(widget.aayCount).toStringAsFixed(1)}%'),
                        SizedBox(width: 6),
                        _LegendItem(color: Colors.pink, label:  '${percent(widget.phhCount).toStringAsFixed(1)}%'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        _LegendItem(color: Colors.blue, label:  '${percent(widget.nphhCount).toStringAsFixed(1)}%' ),
                        SizedBox(width: 6),
                        _LegendItem(color: Colors.grey, label:   '${percent(widget.npnsCount).toStringAsFixed(1)}%'),
                      ],
                    ),
                  ],
                ),

                const SizedBox(width: 6),

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
                            const SizedBox(width: 6),
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
                      const SizedBox(height: 6),
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
                            const SizedBox(width: 6),
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
        },
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
    return LayoutBuilder(
      builder: (context, constraints) {
        // ✅ Convert to double explicitly
       // final iconSize = (constraints.maxHeight * 0.30).toDouble();
        final labelFontSize = (constraints.maxHeight * 0.16).clamp(8.0, 10.0).toDouble();
        final valueFontSize = (constraints.maxHeight * 0.25).clamp(12.0, 14.0).toDouble();
        
        return Stack(
  children: [
    Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: labelFontSize,
          fontWeight: FontWeight.w500,
          color: AppColor.black,
        ),
      ),
    ),

    /// ✅ Bottom-left value decoration
    Positioned(
      bottom: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          value.toString(),
          style: TextStyle(
            fontSize: valueFontSize,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
    ),
  ],
);

      },
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
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}