// lib/feature/drawer/add_basic_details/presentaion/view/add_basic_details_filter.dart
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/data/model/filter_add_basic.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_bloc.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_event.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/presentaion/view/bloc/filter/filter_state.dart';
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
                _buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                      _buildLeftSection(context, state),
                      _buildRightSection(context, state),
                    ],
                  ),
                ),
                _buildBottomButtons(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  // Keep all your existing widget methods (_buildHeader, _buildLeftSection, etc.)
  // ... rest of your existing code remains the same
}

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0277BD), Color(0xFF01579B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              'വിവരങ്ങൾ ഫിൽറ്റർ ചെയ്യുക',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftSection(BuildContext context, FilterStateAddBasic state) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Headers
          Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'നിർദ്ദേശിച്ച',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'ഫിൽട്ടറുകൾ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF334155),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Steps List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.steps.length,
              itemBuilder: (context, index) {
                final isSelected = state.currentStep == index;
                final step = state.steps[index];
final stepName = step.name; // Malayalam for UI
final hasSelection = state.selections.containsKey(step.key); // English key


                return InkWell(
                  onTap: () {
                    context.read<AddBasicFilter>().add(ChangeStepEvent(index));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE0F2FE)
                          : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: isSelected
                              ? const Color(0xFF0284C7)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            stepName,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? const Color(0xFF0C4A6E)
                                  : const Color(0xFF334155),
                            ),
                          ),
                        ),
                        if (hasSelection)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0284C7),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Update _buildRightSection in add_basic_details_filter.dart

Widget _buildRightSection(BuildContext context, FilterStateAddBasic state) {
  return Expanded(
    child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'നിർദ്ദേശിച്ച ഫിൽട്ടറുകൾ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  state.currentStepName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Options
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                children: state.currentOptions.map((option) {
  final stepKey = state.steps[state.currentStep].key;
  final isSelected = state.selections[stepKey] == option.id;

                  return InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () {
                      // Send the ID, not the name
                      context.read<AddBasicFilter>().add(
                            SelectOptionEvent(state.currentStep, option.id),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFDEEBFF)
                            : const Color(0xFFF7FAFC),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          width: 1.5,
                          color: isSelected
                              ? const Color(0xFF0284C7)
                              : const Color(0xFFCBD5E1),
                        ),
                      ),
                      child: Text(
                        option.name, // Display name
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? const Color(0xFF0C4A6E)
                              : const Color(0xFF334155),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildBottomButtons(BuildContext context, FilterStateAddBasic state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((255.0 * 0.05).round()),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Clear All Button
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                context.read<AddBasicFilter>().add(ClearAllSelectionsEvent());
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(
                  color: Color(0xFF0284C7),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'എല്ലാം ശൂന്യമാക്കുക',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0284C7),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Apply Filter Button
          Expanded(
            child: ElevatedButton(
              onPressed: state.hasSelection
                  ? () {
                      if (state.isLastStep) {
                        context.read<AddBasicFilter>().add(SubmitAddFilterSubmitEvent());
                        Navigator.pop(context);
                      } else {
                        context.read<AddBasicFilter>().add(NextStepEvent());
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0284C7),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child: const Text(
                'ഫിൽട്ടർ പ്രയോഗിക്കുക',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
