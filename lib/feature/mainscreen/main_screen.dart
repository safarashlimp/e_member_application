import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/feature/benefit_screen/benefit_screen.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/view/list_family_menu.dart';
import 'package:e_member_app/feature/list_servey_report_menu/list_servey_report_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  final bool? showUpdateDialog;

  const MainScreen({
    super.key,
    this.initialIndex = 0,
    this.showUpdateDialog,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;
  DateTime? _lastBackPressed;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  /// Double back to exit (only from Dashboard)
  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }

    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  /// Bottom nav tab change
  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        final shouldExit = await _onWillPop();
        if (shouldExit && mounted) {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: [
              DashboardPage(updateDiolog: widget.showUpdateDialog), // 0
              const ListServeyReportMenu(), // 1
              const ListFamilyMenu(), // 2
              const BenefitsScreen(), // 3
            ],
          ),
          bottomNavigationBar: AppBottomNav(
            selectedIndex: _currentIndex,
            onTabChanged: _onTabChanged,
          ),
        ),
      ),
    );
  }
}
