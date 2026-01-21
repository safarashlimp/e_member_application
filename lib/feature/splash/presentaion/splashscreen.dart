import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/login/presentation/screen/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

 @override
void initState() {
  super.initState();
  _checkLogin();
}

Future<void> _checkLogin() async {
  final prefs = await SharedPreferences.getInstance();
  final clientId = prefs.getString(PrefKeys.clientId);

  Future.delayed(const Duration(seconds: 3), () {
    if (clientId != null && clientId.isNotEmpty) {
     Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) {
        final datasource = DashboardRemoteDatasource();
        final repository = DashboardRepositoryImpl(datasource);
        final useCase = GetDashboardUseCase(repository);

        return BlocProvider(
          create: (_) =>
              DashboardBloc(useCase)..add(LoadDashboardEvent()),
          child: const DashboardPage(),
        );
      },
    ),
  );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginView()),
      );
    }
  });
}

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Image.asset(
        'assets/logo/logo.png',
        width: 150,   // adjust as needed
        height: 150,
        fit: BoxFit.contain,
      ),
    ),
  );
}

}