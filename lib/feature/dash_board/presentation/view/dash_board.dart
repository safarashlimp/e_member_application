import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text(
            "Dashboard Screen",
            style: TextStyle(fontSize: 22),
          ),
        ),
      
        // 👇 Bottom nav shown in dashboard
        bottomNavigationBar: AppBottomNav(selectedIndex: 2,)
      ),
    );
  }
}
