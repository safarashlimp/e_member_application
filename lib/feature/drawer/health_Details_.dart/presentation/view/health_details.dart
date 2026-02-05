
// import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';
// import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_bloc.dart';
// import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_event.dart';
// import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_state.dart';
// import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/consstats/health_Drawe.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HealthDetailsDrawer extends StatelessWidget {
//   const HealthDetailsDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HealthDrawerBloc(),
//       child: const _HealthDetailsDrawerContent(),
//     );
//   }
// }

// class _HealthDetailsDrawerContent extends StatelessWidget {
//   const _HealthDetailsDrawerContent();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HealthDrawerBloc, HealthDrawerState>(
//       listener: (context, state) {
//         if (state.status == HealthDrawerStatus.success) {
//           Navigator.pop(context, state.filter);
//         } else if (state.status == HealthDrawerStatus.error) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.errorMessage ?? 'Error occurred')),
//           );
//         }
//       },
//       builder: (context, state) {
//         final currentStepName = HealthDrawerConstants.steps[state.currentStep];
//         final currentOptions = HealthDrawerConstants.optionsMap[currentStepName]!;
//         final currentSelection = state.getCurrentSelection();

//         return Drawer(
//           backgroundColor: Colors.white,
//           width: MediaQuery.of(context).size.width,
//           child: SafeArea(
//             child: Column(
//               children: [
//                 // Header
//                 _buildHeader(context),
                
//                 // Body
//                 Expanded(
//                   child: Row(
//                     children: [
//                       // Left Section (Steps)
//                       _buildStepsSection(context, state),
                      
//                       // Right Section (Options)
//                       _buildOptionsSection(
//                         context,
//                         currentStepName,
//                         currentOptions,
//                         currentSelection,
//                       ),
//                     ],
//                   ),
//                 ),
                
//                 // Bottom Buttons
//                 _buildBottomButtons(context, state, currentSelection),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF0277BD), Color(0xFF01579B)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           const Expanded(
//             child: Text(
//               'വിവരങ്ങൾ ഫിൽറ്റർ ചെയ്യുക',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.close, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStepsSection(BuildContext context, HealthDrawerState state) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4,
//       decoration: BoxDecoration(
//         color: const Color(0xFFF1F5F9),
//         border: Border(
//           right: BorderSide(
//             color: Colors.grey.shade300,
//             width: 1,
//           ),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'നിർദ്ദേശിച്ച',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Color(0xFF64748B),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'ഫിൽട്ടറുകൾ',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF334155),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 1),
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemCount: HealthDrawerConstants.steps.length,
//               itemBuilder: (context, index) {
//                 final isSelected = state.currentStep == index;
//                 final stepName = HealthDrawerConstants.steps[index];
//                 final hasSelection = _hasSelectionForStep(state.filter, index);

//                 return InkWell(
//                   onTap: () {
//                     context.read<HealthDrawerBloc>().add(
//                           HealthDrawerStepChanged(index),
//                         );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 14,
//                     ),
//                     decoration: BoxDecoration(
//                       color: isSelected
//                           ? const Color(0xFFE0F2FE)
//                           : Colors.transparent,
//                       border: Border(
//                         left: BorderSide(
//                           color: isSelected
//                               ? const Color(0xFF0284C7)
//                               : Colors.transparent,
//                           width: 3,
//                         ),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             stepName,
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: isSelected
//                                   ? FontWeight.w600
//                                   : FontWeight.w500,
//                               color: isSelected
//                                   ? const Color(0xFF0C4A6E)
//                                   : const Color(0xFF334155),
//                             ),
//                           ),
//                         ),
//                         if (hasSelection)
//                           Container(
//                             width: 8,
//                             height: 8,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFF0284C7),
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   bool _hasSelectionForStep(HealthDrawerFilter filter, int step) {
//     switch (step) {
//       case 0:
//         return filter.isPatient != null;
//       case 1:
//         return filter.hasDisability != null;
//       case 2:
//         return filter.receivesGovernmentBenefits != null;
//       case 3:
//         return filter.hasHealthInsurance != null;
//       case 4:
//         return filter.requiredHealthAssistance != null;
//       default:
//         return false;
//     }
//   }

//   Widget _buildOptionsSection(
//     BuildContext context,
//     String currentStepName,
//     List<String> currentOptions,
//     String? currentSelection,
//   ) {
//     return Expanded(
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'നിർദ്ദേശിച്ച ഫിൽട്ടറുകൾ',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Color(0xFF64748B),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     currentStepName,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFF0F172A),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(height: 1),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Wrap(
//                   spacing: 8,
//                   runSpacing: 10,
//                   children: currentOptions.map((option) {
//                     final isSelected = currentSelection == option;
//                     return InkWell(
//                       borderRadius: BorderRadius.circular(999),
//                       onTap: () {
//                         context.read<HealthDrawerBloc>().add(
//                               HealthDrawerOptionSelected(
//                                 currentStepName,
//                                 option,
//                               ),
//                             );
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? const Color(0xFFDEEBFF)
//                               : const Color(0xFFF7FAFC),
//                           borderRadius: BorderRadius.circular(999),
//                           border: Border.all(
//                             width: 1.5,
//                             color: isSelected
//                                 ? const Color(0xFF0284C7)
//                                 : const Color(0xFFCBD5E1),
//                           ),
//                         ),
//                         child: Text(
//                           option,
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w500,
//                             color: isSelected
//                                 ? const Color(0xFF0C4A6E)
//                                 : const Color(0xFF334155),
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomButtons(
//     BuildContext context,
//     HealthDrawerState state,
//     String? currentSelection,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: OutlinedButton(
//               onPressed: () {
//                 context.read<HealthDrawerBloc>().add(HealthDrawerReset());
//               },
//               style: OutlinedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 side: const BorderSide(color: Color(0xFF0284C7)),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'എല്ലാം ശൂന്യമാക്കുക',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF0284C7),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: currentSelection != null
//                   ? () {
//                       if (state.canGoNext) {
//                         context.read<HealthDrawerBloc>().add(
//                               HealthDrawerNextStep(),
//                             );
//                       } else {
//                         context.read<HealthDrawerBloc>().add(
//                               HealthDrawerSubmit(),
//                             );
//                       }
//                     }
//                   : null,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0284C7),
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 disabledBackgroundColor: Colors.grey.shade300,
//               ),
//               child: const Text(
//                 'ഫിൽട്ടർ പ്രയോഗിക്കുക',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// lib/feature/drawer/health_Details_.dart/presentation/health_details_drawer.dart

import 'package:e_member_app/feature/add_family_members_list/data/repository/dropdownrepo_impl/member_drop_repository_impl.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/data/repo/health_drawer_repository.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_bloc.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_event.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthDetailsDrawer extends StatelessWidget {
  const HealthDetailsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthDrawerBloc(
        HealthDrawerRepositoryImpl(MemberDropRepositoryImpl()) ,
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
                      context.read<HealthDrawerBloc>().add(HealthDrawerInitialize());
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
                _buildHeader(context),
                Expanded(
                  child: Row(
                    children: [
                      _buildStepsSection(context, state),
                      _buildOptionsSection(
                        context,
                        currentStep.name,
                        currentStep.options,
                        currentSelection,
                        state.currentStep,
                      ),
                    ],
                  ),
                ),
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

  Widget _buildStepsSection(BuildContext context, HealthDrawerState state) {
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
                    context.read<HealthDrawerBloc>().add(
                          HealthDrawerStepChanged(index),
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

  bool _hasSelectionForStep(HealthDrawerFilter filter, int step) {
    switch (step) {
      case 0:
        return filter.isPatient != null;
      case 1:
        return filter.hasDisability != null;
      case 2:
        return filter.receivesGovernmentBenefits != null;
      case 3:
        return filter.hasHealthInsurance != null;
      case 4:
        return filter.requiredHealthAssistance != null;
      default:
        return false;
    }
  }

  Widget _buildOptionsSection(
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
                        context.read<HealthDrawerBloc>().add(
                              HealthDrawerOptionSelected(
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

  Widget _buildBottomButtons(
    BuildContext context,
    HealthDrawerState state,
    String? currentSelection,
  ) {
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
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                context.read<HealthDrawerBloc>().add(HealthDrawerReset());
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
                        context.read<HealthDrawerBloc>().add(
                              HealthDrawerNextStep(),
                            );
                      } else {
                        context.read<HealthDrawerBloc>().add(
                              HealthDrawerSubmit(),
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