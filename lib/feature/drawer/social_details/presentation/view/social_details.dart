// lib/feature/drawer/social_details/presentation/social_detail_drawer.dart


import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/social_details/data/repo/socila_drawer_impl.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_bloc.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_event.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_state.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/widget/social_details_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialDetailDrawer extends StatelessWidget {
  const SocialDetailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialDrawerBloc(
        SocialDrawerRepositoryImpl(MemberDropRepositoryImpl()),
      )..add(SocialDrawerInitialize()),
      child: const _SocialDetailDrawerContent(),
    );
  }
}

class _SocialDetailDrawerContent extends StatelessWidget {
  const _SocialDetailDrawerContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialDrawerBloc, SocialDrawerState>(
      listener: (context, state) {
        if (state.status == SocialDrawerStatus.success) {
          Navigator.pop(context, state.filter);
        } else if (state.status == SocialDrawerStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        if (state.status == SocialDrawerStatus.loading && state.steps.isEmpty) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == SocialDrawerStatus.error && state.steps.isEmpty) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? 'Error loading data'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SocialDrawerBloc>().add(SocialDrawerInitialize());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.steps.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('No data available')),
          );
        }

        final currentStep = state.steps[state.currentStep];
        final currentSelection = state.getCurrentSelection();

        return Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
             SocialDetailsDrawer.buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                    SocialDetailsDrawer.buildStepsSection(context, state),
                      SocialDetailsDrawer.buildOptionsSection(
                        context,
                        currentStep.name,
                        currentStep.options,
                        currentSelection,
                        state.currentStep,
                      ),
                    ],
                  ),
                ),
                SocialDetailsDrawer.buildBottomButtons(context, state, currentSelection),
              ],
            ),
          ),
        );
      },
    );
  }

}