import 'package:e_member_app/core/service_locator/service_locator.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/add_family_member_bloc/add_family_member_bloc.dart';
import 'package:e_member_app/feature/login/presentation/screen/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
setupServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider
    (
      
providers: [
  BlocProvider<AddFamilyMemberBloc>(
          create: (_) => AddFamilyMemberBloc(
            repository: getIt<AddFamilyMemberRepository>(),
          ),
        ),
],
      child: MaterialApp(home: LoginView())
      
      );
  }
}
