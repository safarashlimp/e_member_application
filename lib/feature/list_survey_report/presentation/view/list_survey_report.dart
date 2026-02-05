import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/core/widget/common/gradient_header.dart';
import 'package:e_member_app/core/widget/text_field/search_field.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/add_basic_details_filter.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/view/add_Servay_filter.dart';
import 'package:e_member_app/feature/list_servey_report_menu/presentation/navigate_enum/survey_enum.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_state.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/widget/survey_items.dart';
import 'package:e_member_app/feature/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSurveyReport extends StatefulWidget {
  final FamilySurveySectionType sectionType;
  final String postion;
  const ListSurveyReport({
    super.key,
    required this.sectionType,
    required this.postion,
  });

  @override
  State<ListSurveyReport> createState() => _ListSurveyReportState();
}

class _ListSurveyReportState extends State<ListSurveyReport> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  String get pageTitle {
    switch (widget.sectionType) {
      case FamilySurveySectionType.familyBasicDetails:
        return 'വ്യക്തിഗത വിവരം';
      case FamilySurveySectionType.basicFacilities:
        return 'അടിസ്ഥാന സൗകര്യങ്ങൾ';
    }
  }

  @override
  void initState() {
    super.initState();
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
      context.read<HeaderListBloc>().add(LoadMoreHeaders());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Trigger when 200 pixels from bottom
    return currentScroll >= (maxScroll - 200);
  }

  // Open filter drawer and wait for result
  Future<void> _openFilterDrawer() async {
    final result = await showGeneralDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Filter',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: _drawerChosing(),
        );
      },
    );

    // If filters were submitted, apply them
    if (result != null) {
      _applyFilters(result);
    }
  }

  void _applyFilters(Map<String, dynamic> filters) {
    print('🎯 Applying filters to list: $filters');
    context.read<HeaderListBloc>().add(
          ApplyFilters(widget.postion, filters),
        );
  }

  void _clearFilters() {
    context.read<HeaderListBloc>().add(ClearFilters(widget.postion));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: PopScope(
        canPop: false, // ⛔ block default back
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                shouldRefresh: true,
              ),
            ),
          );
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColor.secondary,
          body: Column(
            children: [
              GradientHeader(
                title: 'സമർപ്പിച്ച വിവരങ്ങൾ',
                onPress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchFieldBar(
                  onFilterTap: _openFilterDrawer,
                  hintText: 'വീട് നമ്പർ / പേര് തിരയുക',
                ),
              ),

              // Filter indicator chip
              BlocBuilder<HeaderListBloc, HeaderListState>(
                builder: (context, state) {
                  if (state is HeaderListLoaded && state.hasFilters) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Chip(
                            avatar: const Icon(
                              Icons.filter_alt,
                              size: 16,
                              color: Color(0xFF0284C7),
                            ),
                            label: const Text(
                              'ഫിൽട്ടർ പ്രയോഗിച്ചു',
                              style: TextStyle(fontSize: 12),
                            ),
                            deleteIcon: const Icon(Icons.close, size: 16),
                            onDeleted: _clearFilters,
                            backgroundColor: const Color(0xFFE0F2FE),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Expanded(
                child: Container(
                  color: AppColor.white,
                  child: BlocBuilder<HeaderListBloc, HeaderListState>(
                    builder: (context, state) {
                      if (state is HeaderListLoading) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: AppColor.iconColor,
                        ));
                      }

                      if (state is HeaderListLoaded) {
                        if (state.items.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  state.hasFilters
                                      ? 'ഫിൽട്ടറുകൾക്ക് യോജിക്കുന്ന വിവരങ്ങൾ ഇല്ല'
                                      : 'വിവരങ്ങൾ ലഭ്യമല്ല',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                if (state.hasFilters) ...[
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    onPressed: _clearFilters,
                                    icon: const Icon(Icons.clear),
                                    label: const Text('ഫിൽട്ടറുകൾ മായ്ക്കുക'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.iconColor,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        }

                        print('📱 Displaying ${state.items.length} items');

                        return ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount:
                              state.items.length + (state.hasMoreData ? 1 : 0),
                          itemBuilder: (context, index) {
                            // Show loading indicator at the end if more data available
                            if (index >= state.items.length) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: state.isLoadingMore
                                      ? const CircularProgressIndicator(
                                          color: AppColor.iconColor,
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              );
                            }

                            final item = state.items[index];
                            return PropertyCard(
                              editId: item.editId,
                              position: item.position,
                              sectionType: widget.sectionType,
                              houseNumber: item.houseNumber,
                              houseName: item.houseName,
                              subtitle: item.houseChief,
                              memberCount: item.memberCount,
                              lastUpdated: 'Updated on ${item.lastModified}',
                            );
                          },
                        );
                      }

                      if (state is HeaderListError) {
                        return Center(child: Text(state.message));
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerChosing() {
    if (widget.postion == "1") {
      return const AddSurveyFilterPage();
    } else {
      return const AddBasicDetailsFilter();
    }
  }
}
