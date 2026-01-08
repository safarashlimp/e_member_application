
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/dummy_data/dash_board/bottom_summery_cart.dart';
import 'package:e_member_app/dummy_data/dash_board/genter_section.dart';
import 'package:e_member_app/dummy_data/dash_board/header.dart';
import 'package:e_member_app/dummy_data/dash_board/ration_section.dart';
import 'package:e_member_app/dummy_data/dash_board/top_sas.dart';
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
        backgroundColor:AppColor.secondary,
        body: SingleChildScrollView(
          child: Column(
          
            children: [
              DashBoardHeader(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TopStats(),
              ),
              const SizedBox(height: 16),
             
              GenderSection(),
              const SizedBox(height: 8),
               Text('റേഷൻ കാർഡ് വിതരണം', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.black)),
              const SizedBox(height: 8),
              
              RationSection(),
              const SizedBox(height: 16),
              BottomCards(),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
