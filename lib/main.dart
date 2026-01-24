

import 'package:e_member_app/feature/splash/presentaion/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
//setupServiceLocator();
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
    return MaterialApp(
      home: Splashscreen()
      // home:  Expiredscreen(),
      );
  }
}
