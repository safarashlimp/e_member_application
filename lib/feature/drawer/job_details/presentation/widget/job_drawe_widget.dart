import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_bloc.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_event.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDrawerWidget{


static  Widget buildHeader(BuildContext context) {
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
 

 static  Widget buildStepsSection(BuildContext context, JobDetailsDrawerState state) {
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.steps.length,
              itemBuilder: (context, index) {
                final isSelected = state.currentStep == index;
                final step = state.steps[index];
                final hasSelection = _hasSelectionForStep(state.filter, index);

                return InkWell(
                  onTap: () {
                    context.read<JobDetailsDrawerBloc>().add(
                          JobDetailsDrawerStepChanged(index),
                        );
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
                            step.name,
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

static   bool _hasSelectionForStep(JobDetailsFilter filter, int step) {
    switch (step) {
      case 0:
        return filter.employmentStatus != null;
      case 1:
        return filter.occupation != null;
      case 2:
        return filter.needEmploymentHelp != null;
      default:
        return false;
    }
  }



  static  Widget buildOptionsSection(
    BuildContext context,
    String currentStepName,
    List<dynamic> currentOptions,
    String? currentSelection,
    int stepIndex,
  ) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    currentStepName,
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: currentOptions.map((option) {
                    final isSelected = currentSelection == option.id;
                    return InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () {
                        context.read<JobDetailsDrawerBloc>().add(
                              JobDetailsDrawerOptionSelected(
                                stepIndex,
                                option.id,
                              ),
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
                          option.name,
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





  


 
 static  Widget buildBottomButtons(
  BuildContext context,
  JobDetailsDrawerState state,
  String? currentSelection,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.read<JobDetailsDrawerBloc>().add(
                    JobDetailsDrawerReset(),
                  );
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Color(0xFF0284C7)),
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
        Expanded(
          child: ElevatedButton(
  onPressed: () {
    if (state.canGoNext) {
      context.read<JobDetailsDrawerBloc>().add(JobDetailsDrawerNextStep());
    } else {
      context.read<JobDetailsDrawerBloc>().add(JobDetailsDrawerSubmit());
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF0284C7),
    padding: const EdgeInsets.symmetric(vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child:  Text(
  state.canGoNext ? 'അടുത്തത്' : 'ഫിൽട്ടർ പ്രയോഗിക്കുക',
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

}