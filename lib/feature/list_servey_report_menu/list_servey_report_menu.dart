import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/common/menu_condainer.dart';
import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/data/repository/header_list_repository_impl.dart';
import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/view/list_survey_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ListServeyReportMenu extends StatefulWidget {
  const ListServeyReportMenu({super.key});

  @override
  State<ListServeyReportMenu> createState() => _ListServeyReportMenuState();
}

class _ListServeyReportMenuState extends State<ListServeyReportMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNav(selectedIndex: 1),
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(
              backText: 'back',
              onPress: () {
                Navigator.push(
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
              },
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
            // height: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColor.secondary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    MenuContainar(
                      title: 'അടിസ്ഥാന വിവരങ്ങൾ',
                      iconAsset: 'assets/images/Mask group (14).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightBlue,
                      iconColor: AppColor.iconColor,
                      titleColor: AppColor.iconColor,
                      onIconTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) => HeaderListBloc(
                                GetHeaderListUsecase(
                                  HeaderListRepositoryImpl(http.Client()),
                                ),
                              )..add(FetchHeaderList('1')),
                              child: const ListSurveyReport(
                                sectionType:
                                    FamilySurveySectionType.familyBasicDetails,
                                postion: '1',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    MenuContainar(
                      title: 'അടിസ്ഥാന സൗകര്യങ്ങൾ',
                      iconAsset: 'assets/images/Mask group (15).png',
                      icon: Icons.navigate_next,
                      backgroundColor: AppColor.lightgreen,
                      iconColor: AppColor.green,
                      titleColor: AppColor.green,
                      onIconTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) => HeaderListBloc(
                                GetHeaderListUsecase(
                                  HeaderListRepositoryImpl(http.Client()),
                                ),
                              )..add(FetchHeaderList('2')),
                              child: const ListSurveyReport(
                                sectionType:
                                    FamilySurveySectionType.basicFacilities,
                                postion: '2',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
