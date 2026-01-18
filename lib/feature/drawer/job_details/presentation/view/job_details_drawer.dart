// import 'package:flutter/material.dart';

// class JobDetailsDrawer extends StatefulWidget {
//   const JobDetailsDrawer({super.key});

//   @override
//   State<JobDetailsDrawer> createState() => _JobDetailsDrawerState();
// }

// class _JobDetailsDrawerState extends State<JobDetailsDrawer> {
//   int currentStep = 0;

//   // Store selections for each step
//   final Map<String, String?> selections = {
//     "തൊഴിൽ നില": null,
//     "തൊഴിൽ": null,
//     "തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ": null,
//   };

//   final List<String> steps = [
//     "തൊഴിൽ നില",
//     "തൊഴിൽ",
//     "തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ"
//   ];

//   final Map<String, List<String>> optionsMap = {
//     "തൊഴിൽ നില": [
//       "സ്വയംതൊഴിലാളി",
//       "സ്വയംതൊഴിലുടമ",
//       "സ്ഥിരം ശമ്പള തൊഴിലാളി",
//       "അനിയമിത തൊഴിലാളി",
//       "തൊഴിലില്ലാത്തവൻ",
//       "തൊഴിലില്ലാത്തവൾ",
//       "വീട്ടുപണി",
//       "വിദ്യാർത്ഥി",
//       "ആരോഗ്യ പ്രശ്നങ്ങൾ കാരണം ജോലി ചെയ്യാൻ കഴിയാത്തവർ",
//       "വിരമിച്ചവർ",
//       "വിദേശത്ത് ജോലി ചെയ്യുന്നവർ",
//       "കുട്ടി",
//       "പ്രവാസി",
//       "സർക്കാർ ജീവനക്കാരൻ",
//       "പ്രതിഫലം ഇല്ലാത്ത കുടുംബ തൊഴിലാളി",
//       "മറ്റു വിഭാഗങ്ങൾ"
//     ],
//     "തൊഴിൽ": [
//       "കർഷകൻ",
//       "കർഷക തൊഴിലാളി",
//       "വാടക തൊഴിലാളി",
//       "പ്ലംബർ",
//       "വ്യാപാരി",
//       "ഡ്രൈവർ",
//       "അധ്യാപകൻ",
//       "നഴ്‌സ്",
//       "ഐ.ടി. ജീവനക്കാരൻ",
//       "ഓഫീസ് ജീവനക്കാരൻ",
//       "ഇലക്ട്രീഷ്യൻ",
//       "ലേബർ (തൊഴിലാളി)",
//       "മെക്കാനിക്",
//       "തയ്യൽ",
//       "വീട്ടുജോലി",
//       "മീൻപിടിത്തം",
//       "ഫാക്ടറി തൊഴിലാളി",
//       "ഓട്ടോ ഡ്രൈവർ",
//       "ടാക്സി ഡ്രൈവർ",
//       "ബേക്കറി തൊഴിലാളി",
//       "ഹോട്ടൽ തൊഴിലാളി",
//       "സുരക്ഷാ ജീവനക്കാരൻ"
//     ],
//     "തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ": [
//       "ആശയമില്ല",
//       "തൊഴിൽ പരിശീലനം",
//       "സ്വയം സംരംഭ സഹായം",
//       "മറ്റ്"
//     ],
//   };

//   void goToNextStep() {
//     if (currentStep < steps.length - 1) {
//       setState(() {
//         currentStep++;
//       });
//     }
//   }

//   void goToPreviousStep() {
//     if (currentStep > 0) {
//       setState(() {
//         currentStep--;
//       });
//     }
//   }

//   void selectOption(String option) {
//     setState(() {
//       selections[steps[currentStep]] = option;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentStepName = steps[currentStep];
//     final currentOptions = optionsMap[currentStepName]!;
//     final currentSelection = selections[currentStepName];

//     return Drawer(
//       backgroundColor: Colors.white,
//       width: MediaQuery.of(context).size.width,
//       child: SafeArea(
//         child: Column(
//           children: [
//             // ================= HEADER =================
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF0277BD), Color(0xFF01579B)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   const Expanded(
//                     child: Text(
//                       'വിവരങ്ങൾ ഫിൽറ്റർ ചെയ്യുക',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close, color: Colors.white),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//             ),

//             // ================= BODY =================
//             Expanded(
//               child: Row(
//                 children: [
//                   // -------- LEFT SECTION (Steps) --------
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.4,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF1F5F9),
//                       border: Border(
//                         right: BorderSide(
//                           color: Colors.grey.shade300,
//                           width: 1,
//                         ),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Section Headers
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'നിർദ്ദേശിച്ച',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF64748B),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               const Text(
//                                 'ഫിൽട്ടറുകൾ',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Color(0xFF334155),
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Divider(height: 1),
//                         // Steps List
//                         Expanded(
//                           child: ListView.builder(
//                             padding: EdgeInsets.zero,
//                             itemCount: steps.length,
//                             itemBuilder: (context, index) {
//                               final isSelected = currentStep == index;
//                               final stepName = steps[index];
//                               final hasSelection = selections[stepName] != null;

//                               return InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     currentStep = index;
//                                   });
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                     vertical: 14,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? const Color(0xFFE0F2FE)
//                                         : Colors.transparent,
//                                     border: Border(
//                                       left: BorderSide(
//                                         color: isSelected
//                                             ? const Color(0xFF0284C7)
//                                             : Colors.transparent,
//                                         width: 3,
//                                       ),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           stepName,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: isSelected
//                                                 ? FontWeight.w600
//                                                 : FontWeight.w500,
//                                             color: isSelected
//                                                 ? const Color(0xFF0C4A6E)
//                                                 : const Color(0xFF334155),
//                                           ),
//                                         ),
//                                       ),
//                                       if (hasSelection)
//                                         Container(
//                                           width: 8,
//                                           height: 8,
//                                           decoration: const BoxDecoration(
//                                             color: Color(0xFF0284C7),
//                                             shape: BoxShape.circle,
//                                           ),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // -------- RIGHT SECTION (Options) --------
//                   Expanded(
//                     child: Container(
//                       color: Colors.white,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Section Title
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'നിർദ്ദേശിച്ച ഫിൽട്ടറുകൾ',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Color(0xFF64748B),
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   currentStepName,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     color: Color(0xFF0F172A),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Divider(height: 1),
//                           // Options
//                           Expanded(
//                             child: SingleChildScrollView(
//                               padding: const EdgeInsets.all(16),
//                               child: Wrap(
//                                 spacing: 8,
//                                 runSpacing: 10,
//                                 children: currentOptions.map((option) {
//                                   final isSelected = currentSelection == option;
//                                   return InkWell(
//                                     borderRadius: BorderRadius.circular(999),
//                                     onTap: () => selectOption(option),
//                                     child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16,
//                                         vertical: 8,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: isSelected
//                                             ? const Color(0xFFDEEBFF)
//                                             : const Color(0xFFF7FAFC),
//                                         borderRadius:
//                                             BorderRadius.circular(999),
//                                         border: Border.all(
//                                           width: 1.5,
//                                           color: isSelected
//                                               ? const Color(0xFF0284C7)
//                                               : const Color(0xFFCBD5E1),
//                                         ),
//                                       ),
//                                       child: Text(
//                                         option,
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w500,
//                                           color: isSelected
//                                               ? const Color(0xFF0C4A6E)
//                                               : const Color(0xFF334155),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ================= BOTTOM BUTTONS =================
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: const Offset(0, -2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   // Previous/Cancel Button
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: currentStep > 0 ? goToPreviousStep : null,
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         side: BorderSide(
//                           color: currentStep > 0
//                               ? const Color(0xFF0284C7)
//                               : Colors.grey.shade300,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         currentStep > 0
//                             ? 'എല്ലാം ശൂന്യമാക്കുക'
//                             : 'എല്ലാം ശൂന്യമാക്കുക',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: currentStep > 0
//                               ? const Color(0xFF0284C7)
//                               : Colors.grey.shade400,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   // Next/Submit Button
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: currentSelection != null
//                           ? (currentStep < steps.length - 1
//                               ? goToNextStep
//                               : () {
//                                   // Submit logic
//                                   print('Selections: $selections');
//                                   Navigator.pop(context);
//                                 })
//                           : null,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF0284C7),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         disabledBackgroundColor: Colors.grey.shade300,
//                       ),
//                       child: Text(
//                         currentStep < steps.length - 1
//                             ? 'ഫിൽട്ടർ പ്രയോഗിക്കുക'
//                             : 'ഫിൽട്ടർ പ്രയോഗിക്കുക',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_bloc.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_event.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_state.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/constants/job_details_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsDrawer extends StatelessWidget {
  const JobDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobDetailsDrawerBloc(),
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
        final currentStepName = JobDetailsDrawerConstants.steps[state.currentStep];
        final currentOptions = JobDetailsDrawerConstants.optionsMap[currentStepName]!;
        final currentSelection = state.getCurrentSelection();

        return Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(context),
                
                // Body
                Expanded(
                  child: Row(
                    children: [
                      // Left Section (Steps)
                      _buildStepsSection(context, state),
                      
                      // Right Section (Options)
                      _buildOptionsSection(
                        context,
                        currentStepName,
                        currentOptions,
                        currentSelection,
                      ),
                    ],
                  ),
                ),
                
                // Bottom Buttons
                _buildBottomButtons(context, state, currentSelection),
              ],
            ),
          ),
        );
      },
    );
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

  Widget _buildStepsSection(BuildContext context, JobDetailsDrawerState state) {
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
              itemCount: JobDetailsDrawerConstants.steps.length,
              itemBuilder: (context, index) {
                final isSelected = state.currentStep == index;
                final stepName = JobDetailsDrawerConstants.steps[index];
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

  bool _hasSelectionForStep(JobDetailsFilter filter, int step) {
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

  Widget _buildOptionsSection(
    BuildContext context,
    String currentStepName,
    List<String> currentOptions,
    String? currentSelection,
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
                    final isSelected = currentSelection == option;
                    return InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () {
                        context.read<JobDetailsDrawerBloc>().add(
                              JobDetailsDrawerOptionSelected(
                                currentStepName,
                                option,
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
                          option,
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

  Widget _buildBottomButtons(
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
                context.read<JobDetailsDrawerBloc>().add(JobDetailsDrawerReset());
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
              onPressed: currentSelection != null
                  ? () {
                      if (state.canGoNext) {
                        context.read<JobDetailsDrawerBloc>().add(
                              JobDetailsDrawerNextStep(),
                            );
                      } else {
                        context.read<JobDetailsDrawerBloc>().add(
                              JobDetailsDrawerSubmit(),
                            );
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
}