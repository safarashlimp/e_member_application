import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/core/widget/update_dialoge/update_diologe_helper.dart';
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
 final  bool ? updateDiolog;
   const DashboardPage({super.key,this.updateDiolog});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

@override
void initState() {
  super.initState();


if(widget.updateDiolog==true){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showAppUpdateDialog(context);
  });
}
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          SystemNavigator.pop();
        },
        child: Scaffold(
          bottomNavigationBar: const AppBottomNav(selectedIndex: 0),
          backgroundColor: AppColor.secondary,
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.blue,
                  ),
                );
              }
              if (state is DashboardLoaded) {
                final d = state.data;
                return LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate available height
                    final headerHeight = 100.0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// FIXED HEADER
                        DashBoardHeader(height: headerHeight),

                        /// FLEXIBLE CONTENT
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, contentConstraints) {
                              // Calculate dynamic spacing
                              final spacing =
                                  contentConstraints.maxHeight * 0.01;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: spacing),

                                  // Top Stats - 10% of content height
                                  Flexible(
                                    flex: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TopStats(
                                        housecount: d.houses,
                                        familiesCount: d.families,
                                        memeberscount: d.members,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: spacing),

                                  // Gender Section - 18% of content height
                                  Flexible(
                                    flex: 18,
                                    child: GenderSection(
                                      maleCount: d.male,
                                      femaleCount: d.female,
                                      childrenCount: d.children,
                                      elderlyCount: d.elderly,
                                      disabledCount: d.disabled,
                                      farmersCount: d.farmers,
                                    ),
                                  ),

                                  SizedBox(height: spacing),

                                  // Ration Header
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 4),
                                    child: Text(
                                      'റേഷൻ കാർഡ് വിതരണം',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ),

                                  // Ration Section - 25% of content height
                                  Flexible(
                                    flex: 25,
                                    child: RationSection(
                                      aayCount: d.rationAay,
                                      phhCount: d.rationPhh,
                                      nphhCount: d.rationNphh,
                                      npnsCount: d.rationNpns,
                                    ),
                                  ),

                                  SizedBox(height: spacing),

                                  // Bottom Cards Header
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    child: Text(
                                      'ക്ഷേമ ഗ്രൂപ്പുകൾ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ),

                                  // Bottom Cards - 22% of content height
                                  Flexible(
                                    flex: 22,
                                    child: BottomCards(
                                      thozhilurapCount: d.thozhilurap,
                                      kudumbasreeCount: d.kudumbasree,
                                      harithakarmasenaCount: d.harithakarmasena,
                                    ),
                                  ),

                                  SizedBox(height: spacing),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
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
