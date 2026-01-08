import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary = Color(0xff0085CD);
  static const Color primaryLight = Color(0xff0660AF);
  static const Color primaryDark = Color(0xff1F3F99);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryDark, primary],
    begin: Alignment.topRight,
    end: Alignment.topLeft,
  );

  static const LinearGradient primaryGradientLight = LinearGradient(
    colors: [primaryLight, primary],
    begin: Alignment.topRight,
    end: Alignment.topLeft,
  );

  static const Color secondary = Color(0xffF7FaFC);
  static const Color white = Color(0xffffffff);
  static const Color transparent = Colors.transparent;
  static const Color lightBlue = Color(0xffD1E6FB);
  static const Color backgroundColor1 = Color(0xffBDBDBD);
  static const Color hintText = Color(0xff696969);
  static const Color hintText2 = Color(0xff4A5565);
  static const Color textLabel = Color(0xff333333);
  static const Color textLabel2 = Color(0xff4A5565);
  static const Color borderColor = Color(0xffD5D9E5);
  static const Color border = Color(0xffE5E7EB);
  static const Color black = Color(0xff000000);
  static const Color button = Color(0xff006DD8);
  static const Color white1 = Color(0xffE8F1FA);
  static const Color iconColor = Color(0xff0080C9);
  static const Color grey = Color(0xff8E8E93);
  static const Color grey2 = Color(0xff8F9098);
  static const Color grey1 = Color(0xffCCCCCC);
  static const Color lightGrey = Color(0xffC7C7CC);
  static const Color orange = Color(0xffFF9E42);
  static const Color lightOrange = Color(0xffFFEAD6);
  static const Color green = Color(0xff0FA958);
  static const Color lightgreen = Color(0xffDDF8E2);
  static const Color red = Color(0xffE8505B);
  static const Color lightRed = Color(0xffFFD6DA);
  static const Color purple = Color(0xff7A4DFF);
  static const Color lightPurple = Color(0xffE6DCFF);
  static const Color blue = Color(0xff1E88E5);
  static const Color pink = Color(0xffEC407A);
  static const Color naviBlue = Color(0xff26C6DA);
  static const Color orange1 = Color(0xffF57C00);
  static const Color orange2 = Color(0xffFB8C00);
  static const Color violet = Color(0xff8E24AA);
  static const Color darkGreen = Color(0xff2E7D32);



  
}
