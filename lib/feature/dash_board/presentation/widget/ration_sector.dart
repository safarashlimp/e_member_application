import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RationSection extends StatefulWidget {
  const RationSection({super.key});

  @override
  State<RationSection> createState() => _RationSectionState();
}

class _RationSectionState extends State<RationSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 101,
                  width: 101,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      sections: [
                        PieChartSectionData(
                          value: 152,
                          color: Colors.amber,
                         showTitle: false
                      
                        ),
                        PieChartSectionData(
                          value: 100,
                          color: Colors.pink,
                           showTitle: false
                        
                        ),
                        PieChartSectionData(
                          value: 180,
                          color: Colors.blue,
                           showTitle: false
                        
                        ),
                        PieChartSectionData(
                          value: 80,
                          color: Colors.grey,
                        showTitle: false
                        ),
                      ],
                    ),
                  ),
                ),

                Row(


                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                     _LegendItem(color: Colors.amber, label: '80%'),
                     SizedBox(width: 10,),
        _LegendItem(color: Colors.pink, label: '80%'),
                  ]
                ),
                SizedBox(width: 10,),
                Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        _LegendItem(color: Colors.blue, label: '80%'),
                        SizedBox(width: 10,),
        _LegendItem(color: Colors.grey, label: '80%'),
                  ],
                )
        
              ],
            ),

            SizedBox(width: 2),
            Column(
              children: [
                Row(
                  children: [
                    _RationCard('assets/images/Group 1171275058.png'),
           
                _RationCard('assets/images/Group 1171275059.png',)
                  ],
                ),
               
                Row(
                  children: [
             _RationCard('assets/images/Group 1000002812.png'),
             
                _RationCard('assets/images/Group 1000002813.png'),
                  ],
                )
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _RationCard extends StatelessWidget {
  final String imagePath;

  const _RationCard(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 60,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(12),
      ),
     child: Image.asset(imagePath)  );
  }
}
// class _RationCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final Color color;

//   const _RationCard(this.title, this.value, this.color);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       height: 60,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
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
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}