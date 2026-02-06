import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/view/education_drwer.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/view/health_details.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/view/job_details_drawer.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/view/members_details_drwer.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/view/social_details.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_bloc.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_event.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_state.dart';
import 'package:e_member_app/feature/list_family/presentatioan/widget/family_member_cart.dart';
import 'package:e_member_app/feature/list_family_menu/presentation/navigation_enums/enum.dart';
import 'package:e_member_app/feature/mainscreen/main_screen.dart';

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
  final ScrollController _scrollController = ScrollController();

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

    // Add scroll listener for pagination
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<FamilyMemberListBloc>().add(LoadMoreFamilyMembers());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Trigger when 200 pixels from bottom
    return currentScroll >= (maxScroll - 200);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawerchosing(),
        // bottomNavigationBar: const AppBottomNav(selectedIndex: 2),
        backgroundColor: AppColor.secondary,
        body: Column(
          children: [
            GradientHeader(
              title: 'സമർപ്പിച്ച വിവരങ്ങൾ',
              onPress: () {
                // ✅ Navigate back to MainScreen with refresh flag
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      //shouldRefresh: true
                      ),
                  ),
                  (route) => false, // Remove all previous routes
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchFieldBar(
                onFilterTap: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.white,
                child: BlocBuilder<FamilyMemberListBloc, FamilyMemberListState>(
                    builder: (context, state) {
                  if (state is FamilyMemberListLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      backgroundColor: AppColor.white,
                      color: AppColor.primary,
                    ));
                  }

                  if (state is FamilyMemberListLoaded) {
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount:
                          state.members.length + (state.hasMoreData ? 1 : 0),
                      itemBuilder: (context, index) {
                        // Show loading indicator at the end if more data available
                        if (index >= state.members.length) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: state.isLoadingMore
                                  ? const CircularProgressIndicator(
                                      color: AppColor.primary,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          );
                        }

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
                          ward: 'കുടുംബനാഥനുമായുള്ള ബന്ധം: ${item.relation}',
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

  drawerchosing() {
    if (widget.position == "1") {
      return AddMemberDetailsDrawer();
    } else if (widget.position == "2") {
      return EducationDrawer();
    } else if (widget.position == "3") {
      return JobDetailsDrawer();
    } else if (widget.position == "4") {
      return HealthDetailsDrawer();
    } else if (widget.position == "5") {
      return SocialDetailDrawer();
    }
  }
}
