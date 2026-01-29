// }
// lib/feature/drawer/health_Details_.dart/presentation/health_details_drawer.dart

import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/data/repo/health_drawer_repository.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_bloc.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_event.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_state.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/widget/health_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthDetailsDrawer extends StatelessWidget {
  const HealthDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthDrawerBloc(
        HealthDrawerRepositoryImpl(MemberDropRepositoryImpl()),
      )..add(HealthDrawerInitialize()),
      child: const _HealthDetailsDrawerContent(),
    );
  }
}

class _HealthDetailsDrawerContent extends StatelessWidget {
  const _HealthDetailsDrawerContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HealthDrawerBloc, HealthDrawerState>(
      listener: (context, state) {
        if (state.status == HealthDrawerStatus.success) {
          Navigator.pop(context, state.filter);
        } else if (state.status == HealthDrawerStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        if (state.status == HealthDrawerStatus.loading && state.steps.isEmpty) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == HealthDrawerStatus.error && state.steps.isEmpty) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? 'Error loading data'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<HealthDrawerBloc>()
                          .add(HealthDrawerInitialize());
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
                HealthDrawerWidget.buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                      HealthDrawerWidget.buildStepsSection(context, state),
                      HealthDrawerWidget.buildOptionsSection(
                        context,
                        currentStep.name,
                        currentStep.options,
                        currentSelection,
                        state.currentStep,
                      ),
                    ],
                  ),
                ),
                HealthDrawerWidget.buildBottomButtons(
                    context, state, currentSelection),
              ],
            ),
          ),
        );
      },
    );
  }
}
