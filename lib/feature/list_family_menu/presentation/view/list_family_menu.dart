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
import 'package:e_member_app/feature/list_family/data/repository/Family_member_repo_impl.dart';
import 'package:e_member_app/feature/list_family/domain/user_case/user_case.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_bloc.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_event.dart';
import 'package:e_member_app/feature/list_family/presentatioan/view/list_family.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ListFamilyMenu extends StatefulWidget {
  const ListFamilyMenu({
    super.key,
  });

  @override
  State<ListFamilyMenu> createState() => _ListFamilyMenuState();
}

class _ListFamilyMenuState extends State<ListFamilyMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNav(selectedIndex: 2),
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
           // SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
              
                padding: const EdgeInsets.all(8),
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
                        title: 'കുടുംബാംഗത്തിന്റെ വ്യക്തിഗത വിവരം',
                        iconAsset: 'assets/images/Mask group (16).png',
                        icon: Icons.navigate_next,
                        backgroundColor: AppColor.lightBlue,
                        iconColor: AppColor.iconColor,
                        titleColor: AppColor.iconColor,
                        onIconTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (context) => FamilyMemberListBloc(
                                  GetFamilyMemberListUsecase(
                                    FamilyMemberListRepositoryImpl(http.Client()),
                                  ),
                                )..add(FetchFamilyMemberList("1")),
                                child: ListFamily(
                                  sectionType: SurveySectionType.personal,
                                  position: "1",
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      MenuContainar(
                        title: 'വിദ്യാഭ്യാസം',
                        iconAsset: 'assets/images/Mask group (17).png',
                        icon: Icons.navigate_next,
                        backgroundColor: AppColor.lightgreen,
                        iconColor: AppColor.green,
                        titleColor: AppColor.green,
                        onIconTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) => FamilyMemberListBloc(
                                        GetFamilyMemberListUsecase(
                                          FamilyMemberListRepositoryImpl(
                                              http.Client()),
                                        ),
                                      )..add(FetchFamilyMemberList("2")),
                                      child: ListFamily(
                                        sectionType: SurveySectionType.education,
                                        position: "2",
                                      ),
                                    )),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      MenuContainar(
                        title: 'തൊഴിൽ',
                        iconAsset: 'assets/images/Mask group (18).png',
                        icon: Icons.navigate_next,
                        backgroundColor: AppColor.lightOrange,
                        iconColor: AppColor.orange,
                        titleColor: AppColor.orange,
                        onIconTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) => FamilyMemberListBloc(
                                        GetFamilyMemberListUsecase(
                                          FamilyMemberListRepositoryImpl(
                                              http.Client()),
                                        ),
                                      )..add(FetchFamilyMemberList("3")),
                                      child: ListFamily(
                                        sectionType: SurveySectionType.employment,
                                        position: "3",
                                      ),
                                    )),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      MenuContainar(
                        title: 'ആരോഗ്യം',
                        iconAsset: 'assets/images/Mask group (20).png',
                        icon: Icons.navigate_next,
                        backgroundColor: AppColor.lightRed,
                        iconColor: AppColor.red,
                        titleColor: AppColor.red,
                        onIconTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) => FamilyMemberListBloc(
                                        GetFamilyMemberListUsecase(
                                          FamilyMemberListRepositoryImpl(
                                              http.Client()),
                                        ),
                                      )..add(FetchFamilyMemberList('4')),
                                      child: ListFamily(
                                        sectionType: SurveySectionType.health,
                                        position: '4',
                                      ),
                                    )),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      MenuContainar(
                        title: 'സാമൂഹിക  /  ക്ഷേമ വിവരങ്ങൾ',
                        iconAsset: 'assets/images/Mask group (21).png',
                        icon: Icons.navigate_next,
                        backgroundColor: AppColor.lightPurple,
                        iconColor: AppColor.purple,
                        titleColor: AppColor.purple,
                        onIconTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) => FamilyMemberListBloc(
                                        GetFamilyMemberListUsecase(
                                          FamilyMemberListRepositoryImpl(
                                              http.Client()),
                                        ),
                                      )..add(FetchFamilyMemberList('5')),
                                      child: ListFamily(
                                        sectionType: SurveySectionType.welfare,
                                        position: '5',
                                      ),
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
