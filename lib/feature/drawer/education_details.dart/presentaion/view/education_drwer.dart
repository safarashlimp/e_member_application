

import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_bloc.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_state.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/widget/education_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationDrawer extends StatelessWidget {
  const EducationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EducationDrawerBloc(
        repository: MemberDropRepositoryImpl(),
      ),
      child: const _EducationDrawerContent(),
    );
  }
}

class _EducationDrawerContent extends StatelessWidget {
  const _EducationDrawerContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EducationDrawerBloc, EducationDrawerState>(
      listener: (context, state) {
        if (state.status == EducationDrawerStatus.success) {
          Navigator.pop(context, state.filter);
        } else if (state.status == EducationDrawerStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        // Show loading while fetching API data
        if (state.isLoadingData && state.steps.first.options.isEmpty) {
          return Scaffold(
            backgroundColor: AppColor.secondary,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  CircularProgressIndicator(
                    color: AppColor.blue,
                  ),
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
                EducationDrawerWidget.buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                      EducationDrawerWidget.buildStepsSection(context, state),
                      EducationDrawerWidget.buildOptionsSection(
                        context,
                        currentStepName,
                        currentOptions,
                        currentSelectionId,
                      ),
                    ],
                  ),
                ),
                EducationDrawerWidget.buildBottomButtons(context, state),
              ],
            ),
          ),
        );
      },
    );
  }



  


}