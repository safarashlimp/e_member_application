// import 'package:flutter/material.dart';

// class SocialDetailDrawer extends StatefulWidget {
//   const SocialDetailDrawer({super.key});

//   @override
//   State<SocialDetailDrawer> createState() => _SocialDetailDrawerState();
// }

// class _SocialDetailDrawerState extends State<SocialDetailDrawer> {
//   int currentStep = 0;

//   // Store selections for each step
//   final Map<String, String?> selections = {
//     "റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ": null,
//     "പെൻഷൻ ലഭിക്കുന്നുണ്ടോ?": null,
//     "പെൻഷൻ തരം": null,
//     "പെൻഷൻ ആവശ്യമുണ്ടോ":null,
//     "നിങ്ങൾ ദാരിദ്ര്യ നിർമ്മാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ":null
  
//   };

//   final List<String> steps = [
//     "റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ",
//     "പെൻഷൻ ലഭിക്കുന്നുണ്ടോ",
//     "പെൻഷൻ തരം",
//     "പെൻഷൻ ആവശ്യമുണ്ടോ",
//     "നിങ്ങൾ ദാരിദ്ര്യ നിർമ്മാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ"
//   ];

//   final Map<String, List<String>> optionsMap = {
//     "റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
//     "പെൻഷൻ ലഭിക്കുന്നുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
//     "പെൻഷൻ തരം": [
//       "വാർദ്ധക്യ പെൻഷൻ",
//       "വിധവ പെൻഷൻ",
//       "ഭിന്നശേഷി പെൻഷൻ",
//       "അവിവാഹിത പെൻഷൻ",
//       "കർഷക പെൻഷൻ",
//       "തൊഴിലാളി പെൻഷൻ",
//       "പരമ്പരാഗത തൊഴിലാളി പെൻഷൻ",
//       "മത്സ്യതൊഴിലാളി പെൻഷൻ",
//       "വിധുര പെൻഷൻ",
//       "സ്ത്രീ സുരക്ഷാ പെൻഷൻ",
//       "മറ്റ്"
//     ],
//     "പെൻഷൻ ആവശ്യമുണ്ടോ": [
//       "ആവശ്യമില്ല/അർഹതയില്ല",
//       "വാർദ്ധക്യ പെൻഷൻ",
//       "വിധവ പെൻഷൻ",
//       "ഭിന്നശേഷി പെൻഷൻ",
//       "അവിവാഹിത പെൻഷൻ",
//       "കർഷക പെൻഷൻ",
//       "തൊഴിലാളി പെൻഷൻ",
//       "പരത്തറി തൊഴിലാളി പെൻഷൻ",
//       "പരത്തറി തൊഴിലാളി പെൻഷൻ",
//       "മത്സ്യതൊഴിലാളി പെൻഷൻ",
//       "വിധുര പെൻഷൻ",
//       "സ്ത്രീ സുരക്ഷാ പെൻഷൻ",
//       "മറ്റ്"
//     ],
//     "നിങ്ങൾ ദാരിദ്ര്യ നിർമ്മാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ":[
//       "തൊഴിലുറപ്പ്","കുടുംബശ്രീ","ഹരിത കർമ്മസേന","അല്ല"
//     ]
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

import 'package:e_member_app/feature/drawer/social_details/domain/entity/social_entity.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_bloc.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_event.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_state.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/const/social_filter_constatData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialDetailDrawer extends StatelessWidget {
  const SocialDetailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialDrawerBloc(),
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
        final currentStepName = SocialDrawerConstants.steps[state.currentStep];
        final currentOptions = SocialDrawerConstants.optionsMap[currentStepName]!;
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

  Widget _buildStepsSection(BuildContext context, SocialDrawerState state) {
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
              itemCount: SocialDrawerConstants.steps.length,
              itemBuilder: (context, index) {
                final isSelected = state.currentStep == index;
                final stepName = SocialDrawerConstants.steps[index];
                final hasSelection = _hasSelectionForStep(state.filter, index);

                return InkWell(
                  onTap: () {
                    context.read<SocialDrawerBloc>().add(
                          SocialDrawerStepChanged(index),
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

  bool _hasSelectionForStep(SocialDrawerFilter filter, int step) {
    switch (step) {
      case 0:
        return filter.includedInRationCard != null;
      case 1:
        return filter.receivingPension != null;
      case 2:
        return filter.pensionType != null;
      case 3:
        return filter.needPension != null;
      case 4:
        return filter.povertyAlleviationMember != null;
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
                        context.read<SocialDrawerBloc>().add(
                              SocialDrawerOptionSelected(
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
    SocialDrawerState state,
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
                context.read<SocialDrawerBloc>().add(SocialDrawerReset());
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
                        context.read<SocialDrawerBloc>().add(
                              SocialDrawerNextStep(),
                            );
                      } else {
                        context.read<SocialDrawerBloc>().add(
                              SocialDrawerSubmit(),
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
