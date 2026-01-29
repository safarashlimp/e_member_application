// lib/feature/drawer/members_details/presentation/view/add_member_details_drawer.dart
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/bloc/bloc/member_detail_bloc.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/bloc/bloc/member_detail_state.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/widget/member_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberDetailsDrawer extends StatelessWidget {
  const AddMemberDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberDetailsBloc(
        repository: MemberDropRepositoryImpl(),
      ),
      child: const _AddMemberDetailsDrawerContent(),
    );
  }
}

class _AddMemberDetailsDrawerContent extends StatelessWidget {
  const _AddMemberDetailsDrawerContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MemberDetailsBloc, MemberDetailsState>(
      listener: (context, state) {
        if (state.status == MemberDetailsStatus.success) {
          Navigator.pop(context, state.filter);
        } else if (state.status == MemberDetailsStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        // Show loading while fetching API data
        if (state.isLoadingData && state.steps.first.options.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('ഫിൽട്ടർ ഡാറ്റ ലോഡ് ചെയ്യുന്നു...'),
                ],
              ),
            ),
          );
        }

        final currentStepName = state.currentStepName;
        final currentOptions = state.currentOptions.cast<FilterOption>();
        final currentSelectionId = state.getCurrentSelection();

        return Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
               MemberDrawerWidget. buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                 MemberDrawerWidget .buildStepsSection(context, state),
                     MemberDrawerWidget.buildOptionsSection(
                        context,
                        currentStepName,
                        currentOptions,
                        currentSelectionId,
                      ),
                    ],
                  ),
                ),
               MemberDrawerWidget. buildBottomButtons(context, state, currentSelectionId),
              ],
            ),
          ),
        );
      },
    );
  }

  
}