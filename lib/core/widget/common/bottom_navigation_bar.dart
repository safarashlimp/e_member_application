
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/view/list_family_menu.dart';
import 'package:e_member_app/feature/list_servey_report_menu/list_servey_report_menu.dart';
import 'package:flutter/material.dart';
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final double height;

  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    this.height = 80,
  });

  /// ---------------- NAVIGATION ----------------
  void _onTap(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
  final datasource = DashboardRemoteDatasource();
  final repository = DashboardRepositoryImpl(datasource);
  final useCase = GetDashboardUseCase(repository);

  page = BlocProvider(
    create: (_) =>
        DashboardBloc(useCase)..add(LoadDashboardEvent()),
    child: const DashboardPage(),
  );
  

        break;
      case 1:
        page = const ListServeyReportMenu();
        break;
      case 2:
       page =  const ListFamilyMenu();
        break;
      // case 3:
      //   page = const AddItemBasicDetails();
      //   break;
      default:
         ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("⚠️ ഈ ഓപ്ഷൻ ഇപ്പോൾ ലഭ്യമല്ല"),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
    return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [

        /// MAIN NAV BAR
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColor.primaryGradient,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),

        /// LIGHT GRADIENT BOTTOM
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.45,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
    colors: [ AppColor.primary,AppColor.primaryLight],
    begin: Alignment.topRight,
    end: Alignment.topLeft,
  ),
            ),
          ),
        ),

        /// NAV ITEMS (4 ITEMS)
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(context, 0),
              _navItem(context, 1),

              const SizedBox(width: 70), // 👈 SPACE FOR FAB

              _navItem(context, 2),
              _navItem(context, 3),
            ],
          ),
        ),

        /// CENTER FLOATING ACTION BUTTON
        Positioned(
          top: -30,
          child: GestureDetector(
            onTap: () {
                Navigator.push(
  context,
  MaterialPageRoute(
         builder: (context) => AddServyItems(mode: PageMode.add)

  ),
);
            },
            child: Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.button, width: 4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/Mask group (24).png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// ---------------- NAV ITEM ----------------
  Widget _navItem(BuildContext context, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(context, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            _image(index),
            width: 24,
            height: 24,
            color: isSelected ? AppColor.white : AppColor.grey1,
          ),
          const SizedBox(height: 4),
          Text(
            _label(index),
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColor.white : AppColor.grey1,
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- ICONS ----------------
  String _image(int index) {
    switch (index) {
      case 0: 
        return 'assets/images/Vector (2).png';
      case 1:
        return 'assets/images/Mask group (22).png';
      case 2:
        return 'assets/images/Mask group (23).png';
      
      default:
        return 'assets/images/Group 1171275074.png';
    }
  }

  /// ---------------- LABELS ----------------
  String _label(int index) {
    switch (index) {
      case 0:
        return "ഡാഷ്‌ബോർഡ്";
      case 1:
        return "കുടുംബങ്ങൾ";
      case 2:
        return "അംഗങ്ങൾ";

      default:
          return "ആനുകൂല്യങ്ങൾ";
    }
  }
}