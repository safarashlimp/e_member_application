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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: const [
            Expanded(
              child: Placeholder(fallbackHeight: 120), // Pie chart
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  _RationCard('മഞ്ഞ (AAY)', '152', Colors.amber),
                  SizedBox(height: 8),
                  _RationCard('പിങ്ക് (PHH)', '100', Colors.pink),
                  SizedBox(height: 8),
                  _RationCard('നീല (NPHH)', '180', Colors.blue),
                  SizedBox(height: 8),
                  _RationCard('വെള്ള (NPNS)', '80', Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _RationCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _RationCard(this.title, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
