import 'dart:convert';
import 'dart:io';

import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/core/widget/app_expired_dialog/app_expired_dialog.dart';
import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/login/presentation/screen/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
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
  final isValidApp = await checkAppExpiry();

  if (!isValidApp) {
    _showExpiredDiolog();
    return;
  }

  final prefs = await SharedPreferences.getInstance();
  final clientId = prefs.getString(PrefKeys.clientId);

  Future.delayed(const Duration(seconds: 3), () {
    if (clientId != null && clientId.isNotEmpty) {
      _goToDashboard();
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


Future<String> getAppVersion() async {
  final info = await PackageInfo.fromPlatform();
  return info.buildNumber; 
}
Future<bool> checkAppExpiry() async {
  final prefs = await SharedPreferences.getInstance();
  final clientId = prefs.getString(PrefKeys.clientId) ?? "0";
  final userId = prefs.getString(PrefKeys.userId) ?? "0";

  final url = Uri.parse(
    "https://emember.org/API/check_app.php?clientid=$clientId&userid=$userId",
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    if (json["Status"] == true) {
      final data = json["data"][0];

      final expired = data["expired"];
      if (expired == 1) {
        return false;
      }

      final currentVersion = await getAppVersion();

      if (Platform.isAndroid) {
        print(" this is current android version $currentVersion");
        print(" this is  from backend api gave android version  ${data["Android_version_number"]}");
      
        return currentVersion == data["Android_version_number"];
      } else if (Platform.isIOS) {
        return currentVersion == data["IOS_version_number"];
      }
    }
  }

  return false;
}

void _goToDashboard() {
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
}


_showExpiredDiolog(){

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Expiredscreen()));
}
}