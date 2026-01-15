import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/list_servey_report_menu/list_servey_report_menu.dart';
import 'package:e_member_app/feature/login/data/repository/login_repository.dart';
import 'package:e_member_app/feature/login/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:e_member_app/core/widget/button/app_action_button.dart';
import 'package:e_member_app/core/widget/text_field/app_text_field.dart';
import 'package:e_member_app/core/util/validator/validator.dart';
import 'package:e_member_app/core/theme/app_color/app_color.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(repository: LoginRepository()),
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        body: SafeArea(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
            if (state is LoginSuccess) {
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
else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo/logo.png",
                        width: 170,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 90),
                      AppTextField(
                        controller: emailController,
                        hintText: "user Name",
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
                        hintText: "Password",
                        label: "പാസ്‌വേഡ്",
                        labelColor: AppColor.hintText,
                        type: "text",
                        width: double.infinity,
                        height: 40,
                      ),
                      SizedBox(height: 40),
                      state is LoginLoading
                          ? CircularProgressIndicator(
                            color: AppColor.blue,
                          )
                          : AppActionButton(
                              label: "ലോഗിൻ",
                              onPressed: () {
                                final email = emailController.text;
                                final password = passwordController.text;
                                context.read<LoginBloc>().add(
                                      LoginButtonPressed(
                                        email: email,
                                        password: password,
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
              );
            },
          ),
        ),
      ),
    );
  }
}