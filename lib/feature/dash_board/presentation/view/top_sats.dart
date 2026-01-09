import 'package:flutter/material.dart';

class TopStats extends StatefulWidget {
  const TopStats({super.key});

  @override
  State<TopStats> createState() => _TopStatsState();
}

class _TopStatsState extends State<TopStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _StatCard(
          icon: 'assets/images/home.png',
          label: 'വീടുകൾ',
          value: '350',
        ),
        SizedBox(width: 12),
        _StatCard(
          icon: 'assets/images/Mask group (25).png',
          label: 'കുടുംബങ്ങൾ',
          value: '350',
        ),
        SizedBox(width: 12),
        _StatCard(
          icon: 'assets/images/Mask group (26).png',
          label: 'ജനസംഖ്യ',
          value: '1500',
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 60,
      padding: const EdgeInsets.only(left: 5, top: 8, bottom: 8, ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
           SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(icon, width: 30,height: 30,)),
          const SizedBox(width: 3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            
              Text(value, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}