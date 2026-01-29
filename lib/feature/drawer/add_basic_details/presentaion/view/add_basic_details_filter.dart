// lib/feature/drawer/add_basic_details/presentaion/view/add_basic_details_filter.dart
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/data/model/filter_add_basic..dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/bloc/filter/filter_bloc.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/bloc/filter/filter_event.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/bloc/filter/filter_state.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/widget/addbasicdetails_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBasicDetailsFilter extends StatelessWidget {
  const AddBasicDetailsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBasicFilter(
        steps: FilterData.basicDetailsSteps,
        repository: FamilyDropRepositoryImpl(), // Using your existing repository
      ),
      child: const _FilterDrawerContent(),
    );
  }
}

class _FilterDrawerContent extends StatelessWidget {
  const _FilterDrawerContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBasicFilter, FilterStateAddBasic>(
      builder: (context, state) {
        // Show loading indicator while fetching data
        if (state.isLoading && state.steps.first.options.isEmpty) {
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

        // Show error if loading failed
        if (state.error != null) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'പിശക്: ${state.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AddBasicFilter>().add(LoadFilterDataEvent());
                    },
                    child: const Text('വീണ്ടും ശ്രമിക്കുക'),
                  ),
                ],
              ),
            ),
          );
        }

        return Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
               AddbasicdetailsWidget.buildHeader(context),
                               Expanded(
                  child: Row(
                    children: [
                      AddbasicdetailsWidget.buildLeftSection(context, state),
                      AddbasicdetailsWidget.buildRightSection(context, state),
                    ],
                  ),
                ),
              AddbasicdetailsWidget.buildBottomButtons(context, state),
              ],
            ),
          ),
        );
      },
    );
  }


}



