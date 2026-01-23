import 'package:e_member_app/core/theme/app_color/app_color.dart';

import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';
import 'package:e_member_app/feature/dash_board/data/datasource/dashboard_remote_datasource.dart';
import 'package:e_member_app/feature/dash_board/data/repository/dashboard_repository_impl.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:e_member_app/feature/dash_board/presentation/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:e_member_app/feature/dash_board/presentation/view/dash_board_screen.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_bloc.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_event.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_state.dart';
import 'package:e_member_app/feature/list_family/presentatioan/widget/family_member_cart.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFamily extends StatefulWidget {
  final SurveySectionType sectionType;
  final String position;
  const ListFamily(
      {super.key, required this.sectionType, required this.position});

  @override
  State<ListFamily> createState() => _ListFamilyState();
}

class _ListFamilyState extends State<ListFamily> {
  String get pageTitle {
    switch (widget.sectionType) {
      case SurveySectionType.personal:
        return 'വ്യക്തിഗത വിവരം';
      case SurveySectionType.education:
        return 'വിദ്യാഭ്യാസം';
      case SurveySectionType.employment:
        return 'തൊഴിൽ';
      case SurveySectionType.health:
        return 'ആരോഗ്യം';
      case SurveySectionType.welfare:
        return 'ക്ഷേമ വിവരങ്ങൾ';
    }
  }

  @override
  void initState() {
    super.initState();
    context
        .read<FamilyMemberListBloc>()
        .add(FetchFamilyMemberList(widget.position));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        // bottomNavigationBar: const AppBottomNav(selectedIndex: 2),
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(
              title: 'സമർപ്പിച്ച വിവരങ്ങൾ',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchFieldBar(),
            ),
            Expanded(
              child: Container(
                color: AppColor.white,
                child: BlocBuilder<FamilyMemberListBloc, FamilyMemberListState>(
                    builder: (context, state) {
                  if (state is FamilyMemberListLoading) {
                    return const Center(child: CircularProgressIndicator(
                      backgroundColor: AppColor.white,
                      color: AppColor.primary,
                    ));
                  }

                  if (state is FamilyMemberListLoaded) {
                print(state.members.first); 
                
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.members.length,
                      itemBuilder: (context, index) {
                        final item = state.members[index];
                        
                        return MemberCard(
                          //  position: item.position ,
                          position: widget.position,
                          editId: item.editId,
                          sectionType: widget.sectionType,
                          name: item.name,
                          houseName: item.houseName,
                          houseNumber: item.houseNumber,
                          phone: item.mobile,
                          whatsapp: item.whatsapp,
                          ward: 'കുടുംബനാമനുമായുള്ള ബന്ധം: ${item.relation}',
                          age: 'വയസ്: ${item.age}',
                          lastUpdated: 'Updated on ${item.lastModified}',
                          
                        );
                      },
                    );
                  }
                  if (state is FamilyMemberListError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
