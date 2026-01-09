import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';

import 'package:e_member_app/feature/dash_board/presentation/view/bottom_cart.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_header.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/gender_sector.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/ration_sector.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/top_sats.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNav(selectedIndex: 0),
        backgroundColor: AppColor.secondary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔒 FIXED HEADER (NO SCROLL)
            DashBoardHeader(),

            /// 🔽 SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TopStats(),
                    ),

                    const SizedBox(height: 8),

                    GenderSection(),

                    //const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Text(
                        'റേഷൻ കാർഡ് വിതരണം',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                    ),

                    RationSection(),

                  

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child: Text(
                        'ക്ഷേമ ഗ്രൂപ്പുകൾ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                    ),

                    BottomCards(),
                   // const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
