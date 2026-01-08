

import 'package:flutter/material.dart';

class BottomCards extends StatefulWidget {
  const BottomCards({super.key});

  @override
  State<BottomCards> createState() => _BottomCardsState();
}

class _BottomCardsState extends State<BottomCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: const [
          _MiniCard('assets/icons/people.png', '540'),
          _MiniCard('assets/icons/group.png', '540'),
          _MiniCard('assets/icons/recycle.png', '540'),
        ],
      ),
    );
  }
}
class _MiniCard extends StatelessWidget {
  final String icon;
  final String value;

  const _MiniCard(this.icon, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(icon, height: 28),
          const SizedBox(height: 8),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
