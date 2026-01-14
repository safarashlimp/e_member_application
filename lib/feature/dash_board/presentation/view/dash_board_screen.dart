import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_state.dart';

import 'package:e_member_app/feature/dash_board/presentation/widget/bottom_cart.dart';
import 'package:e_member_app/feature/dash_board/presentation/widget/dash_board_header.dart';
import 'package:e_member_app/feature/dash_board/presentation/widget/gender_sector.dart';
import 'package:e_member_app/feature/dash_board/presentation/widget/ration_sector.dart';
import 'package:e_member_app/feature/dash_board/presentation/widget/top_sats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: PopScope(
        canPop: false, // 🚫 prevent navigation back
        onPopInvoked: (didPop) {
          if (didPop) return;

          // ✅ Exit the app
          SystemNavigator.pop();
        },
        child: Scaffold(
          bottomNavigationBar: const AppBottomNav(selectedIndex: 0),
          backgroundColor: AppColor.secondary,
          body: BlocBuilder<DashboardBloc, DashboardState>(

            
            builder: (context, state) {
      
            if (state is DashboardLoading) {
      return const Center(child: CircularProgressIndicator());
    }
      if(state is DashboardLoaded){

        final d =state.data;
              return Column(
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
                            child: TopStats(
                                housecount: d.houses,
                                familiesCount: d.families,
                                memeberscount: d.members),
                          ),

                          const SizedBox(height: 8),

                          GenderSection(
                              maleCount: d.male,
                              femaleCount: d.female,
                              childrenCount: d.children,
                              elderlyCount: d.elderly,
                              disabledCount: d.disabled,
                              farmersCount: d.farmers),

                          //const SizedBox(height: 5),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Text(
                              'റേഷൻ കാർഡ് വിതരണം',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                              ),
                            ),
                          ),

                          RationSection(
                              aayCount: d.rationAay,
                              phhCount: d.rationPhh,
                              nphhCount: d.rationNphh,
                              npnsCount: d.rationNpns),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Text(
                              'ക്ഷേമ ഗ്രൂപ്പുകൾ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                              ),
                            ),
                          ),

                          BottomCards(
                              thozhilurapCount: d.thozhilurap,
                              kudumbasreeCount: d.kudumbasree,
                              harithakarmasenaCount: d.harithakarmasena),
                          // const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
