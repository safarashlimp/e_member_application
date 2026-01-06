import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset(
                  "assets/logo/logo.png",
                  width: 170,
                  height: 150,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 90),
                AppTextField(
                  controller: userNameController,
                  hintText: "User Name",
                  label: 'യൂസർനെയിം',
                  labelColor: AppColor.hintText,
                  validator: Validator.validateUsername,
                  type: "text",
                  width: double.infinity,
                  height: 40,
                ),
                SizedBox(height: 20),
                AppTextField(
                  controller: passwordController,
                  hintText: "password",
                  label: "പാസ്‌വേഡ്",
                  labelColor: AppColor.hintText,
                  type: "text",
                  width: double.infinity,
                  height: 40,
                ),
                SizedBox(height: 40),
                AppActionButton(
                  label: "ലോഗിൻ",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListSurveyReport(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 180),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Developed by |",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2767FF),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 12.5,
                      child: Image.asset(
                        'assets/logo/Workmate Infotech Private Limited  Logo.png',
                        height: 12,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
