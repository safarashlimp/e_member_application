// import 'package:flutter/material.dart';

// class EducationDrwer extends StatefulWidget {
//   const EducationDrwer({super.key});

//   @override
//   State<EducationDrwer> createState() => _EducationDrwerState();
// }

// class _EducationDrwerState extends State<EducationDrwer> {
//   int currentStep = 0;
  
//   // Store selections for each step
//   final Map<String, String?> selections = {
//     "വിദ്യാഭ്യാസ യോഗ്യത": null,
//     "ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ": null,
   
//   };

//   final List<String> steps = [
//     "വിദ്യാഭ്യാസ യോഗ്യത",
//     " ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ",
   
//   ];

//   final Map<String, List<String>> optionsMap = {
//     "വിദ്യാഭ്യാസ യോഗ്യത": ["അക്ഷരജ്ഞാനം ഇല്ല", "ഔപചാരിക വിദ്യാഭ്യാസമില്ലാത്ത അക്ഷരജ്ഞാനം ", "പ്രാഥമികം","യു.പി (Upper Primary)","സെക്കൻഡറി","ഹയർ സെക്കൻഡറി","ബിരുദം","ബിരുദാനന്തര ബിരുദം","ഡിപ്ലോമ"],
//     "ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
   
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
//                                         borderRadius: BorderRadius.circular(999),
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
//                         currentStep > 0 ? 'എല്ലാം ശൂന്യമാക്കുക' : 'എല്ലാം ശൂന്യമാക്കുക',
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


// lib/feature/drawer/education_details.dart/presentaion/view/education_drawer.dart
import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/add_basic_details/domain/entitties/filter_addbasic.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_entity.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_bloc.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_event.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_state.dart';
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
                _buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                      _buildStepsSection(context, state),
                      _buildOptionsSection(
                        context,
                        currentStepName,
                        currentOptions,
                        currentSelectionId,
                      ),
                    ],
                  ),
                ),
                _buildBottomButtons(context, state, currentSelectionId),
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

  Widget _buildStepsSection(BuildContext context, EducationDrawerState state) {
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
                final stepName = state.steps[index].name;
                final hasSelection = _hasSelectionForStep(state.filter, index);

                return InkWell(
                  onTap: () {
                    context.read<EducationDrawerBloc>().add(
                          EducationDrawerStepChanged(index),
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

  bool _hasSelectionForStep(EducationFilter filter, int step) {
    switch (step) {
      case 0:
        return filter.educationalQualificationId != null;
      case 1:
        return filter.currentlyStudyingId != null;
      default:
        return false;
    }
  }

  Widget _buildOptionsSection(
    BuildContext context,
    String currentStepName,
    List<FilterOption> currentOptions,
    String? currentSelectionId,
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
                    final isSelected = currentSelectionId == option.id;
                    return InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () {
                        // Send ID instead of name
                        context.read<EducationDrawerBloc>().add(
                              EducationDrawerOptionSelected(
                                currentStepName,
                                option.id, // Passing ID
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

  Widget _buildBottomButtons(
    BuildContext context,
    EducationDrawerState state,
    String? currentSelectionId,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((255.0 *0.05).round()),
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
                context.read<EducationDrawerBloc>().add(const EducationDrawerReset());
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
              onPressed: currentSelectionId != null
                  ? () {
                      if (state.canGoNext) {
                        context.read<EducationDrawerBloc>().add(
                              const EducationDrawerNextStep(),
                            );
                      } else {
                        context.read<EducationDrawerBloc>().add(
                              const EducationDrawerSubmit(),
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