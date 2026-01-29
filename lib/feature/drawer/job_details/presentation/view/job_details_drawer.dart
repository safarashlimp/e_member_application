// lib/feature/drawer/job_details/presentation/job_details_drawer.dart

import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/job_details/data/repo/job_repository.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_bloc.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_event.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_state.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/widget/job_drawe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsDrawer extends StatelessWidget {
  const JobDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobDetailsDrawerBloc(
        JobDrawerRepositoryImpl(MemberDropRepositoryImpl()),
      )..add(JobDetailsDrawerInitialize()),
      child: const _JobDetailsDrawerContent(),
    );
  }
}

class _JobDetailsDrawerContent extends StatelessWidget {
  const _JobDetailsDrawerContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsDrawerBloc, JobDetailsDrawerState>(
      listener: (context, state) {
        if (state.status == JobDetailsDrawerStatus.success) {
          Navigator.pop(context, state.filter);
        } else if (state.status == JobDetailsDrawerStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        if (state.status == JobDetailsDrawerStatus.loading && state.steps.isEmpty) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == JobDetailsDrawerStatus.error && state.steps.isEmpty) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? 'Error loading data'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<JobDetailsDrawerBloc>().add(JobDetailsDrawerInitialize());
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
               JobDrawerWidget.buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                   JobDrawerWidget.buildStepsSection(context, state),
                     JobDrawerWidget.buildOptionsSection(
                        context,
                        currentStep.name,
                        currentStep.options,
                        currentSelection,
                        state.currentStep,
                      ),
                    ],
                  ),
                ),
               JobDrawerWidget.buildBottomButtons(context, state, currentSelection),
              ],
            ),
          ),
        );
      },
    );
  }

 

 

}