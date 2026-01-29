
import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/data/repository/filter_repository_impl.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/ussecase/submit_filter.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_bloc.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_event.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/bloc/bloc/filter_state.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/presentation/widget/add_servay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSurveyFilterPage extends StatelessWidget {
  const AddSurveyFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(
        getFilterOptions: GetFilterOptions(FilterRepositoryImpl()),
        submitFilters: SubmitFilters(FilterRepositoryImpl()),
      )..add(LoadFilters()),
      child: const AddSurveyFilterView(),
    );
  }
}

class AddSurveyFilterView extends StatelessWidget {
  const AddSurveyFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilterBloc, FilterState>(
      listenWhen: (previous, current) => 
          current.status == FilterStatus.submitted,
      listener: (context, state) {
        // Return the filter payload to the list page
        Navigator.pop(context, state.filterPayload);
      },
      child: Drawer(
        backgroundColor: AppColor.secondary,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              if (state.status == FilterStatus.loading || 
                  state.status == FilterStatus.initial) {
                return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  CircularProgressIndicator(
                    color: AppColor.blue,
                  ),
                  SizedBox(height: 16),
                  Text('ഫിൽട്ടർ ഡാറ്റ ലോഡ് ചെയ്യുന്നു...'),
                ],
              );
              }

              return Column(
                children: [
                  AddServayWidget.buildHeader(context),
                  Expanded(
                    child: Row(
                      children: [
                        AddServayWidget .builderleftSide(context, state),
                        AddServayWidget.buildRightSide(context, state),
                      ],
                    ),
                  ),
                  AddServayWidget.bottonwidget(context, state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget _buildHeader(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [Color(0xFF0277BD), Color(0xFF01579B)],
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //     ),
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //     child: Row(
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.arrow_back, color: Colors.white),
  //           onPressed: () => Navigator.pop(context),
  //         ),
  //         const Expanded(
  //           child: Text(
  //             'വിവരങ്ങൾ ഫിൽറ്റർ ചെയ്യുക',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 18,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.close, color: Colors.white),
  //           onPressed: () => Navigator.pop(context),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildLeftSection(BuildContext context, FilterState state) {
    // return Container(
    //   width: MediaQuery.of(context).size.width * 0.4,
    //   decoration: BoxDecoration(
    //     color: const Color(0xFFF1F5F9),
    //     border: Border(
    //       right: BorderSide(
    //         color: Colors.grey.shade300,
    //         width: 1,
    //       ),
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Container(
    //         padding: const EdgeInsets.all(16),
    //         child: const Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               'നിർദ്ദേശിച്ച',
    //               style: TextStyle(
    //                 fontSize: 12,
    //                 color: Color(0xFF64748B),
    //                 fontWeight: FontWeight.w500,
    //               ),
    //             ),
    //             SizedBox(height: 4),
    //             Text(
    //               'ഫിൽട്ടറുകൾ',
    //               style: TextStyle(
    //                 fontSize: 14,
    //                 color: Color(0xFF334155),
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Divider(height: 1),
    //       Expanded(
    //         child: ListView.builder(
    //           padding: EdgeInsets.zero,
    //           itemCount: state.filterOptions.length,
    //           itemBuilder: (context, index) {
    //             final isSelected = state.currentStep == index;
    //             final option = state.filterOptions[index];
    //             final hasSelection = 
    //                 state.selections.selections[option.id] != null;

    //             return InkWell(
    //               onTap: () => 
    //                   context.read<FilterBloc>().add(ChangeStep(index)),
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 16,
    //                   vertical: 14,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   color: isSelected
    //                       ? const Color(0xFFE0F2FE)
    //                       : Colors.transparent,
    //                   border: Border(
    //                     left: BorderSide(
    //                       color: isSelected
    //                           ? const Color(0xFF0284C7)
    //                           : Colors.transparent,
    //                       width: 3,
    //                     ),
    //                   ),
    //                 ),
    //                 child: Row(
    //                   children: [
    //                     Expanded(
    //                       child: Text(
    //                         option.label,
    //                         style: TextStyle(
    //                           fontSize: 14,
    //                           fontWeight: isSelected
    //                               ? FontWeight.w600
    //                               : FontWeight.w500,
    //                           color: isSelected
    //                               ? const Color(0xFF0C4A6E)
    //                               : const Color(0xFF334155),
    //                         ),
    //                       ),
    //                     ),
    //                     if (hasSelection)
    //                       Container(
    //                         width: 8,
    //                         height: 8,
    //                         decoration: const BoxDecoration(
    //                           color: Color(0xFF0284C7),
    //                           shape: BoxShape.circle,
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  // }

  // Widget _buildRightSection(BuildContext context, FilterState state) {
    // final currentFilter = state.currentFilterOrNull;
    // if (currentFilter == null) {
    //   return const Expanded(
    //     child: Center(child: Text('No filter available')),
    //   );
    // }

    // final currentSelection = state.currentSelection;

    // return Expanded(
    //   child: Container(
    //     color: Colors.white,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(16),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Text(
    //                 'നിർദ്ദേശിച്ച ഫിൽട്ടറുകൾ',
    //                 style: TextStyle(
    //                   fontSize: 12,
    //                   color: Color(0xFF64748B),
    //                   fontWeight: FontWeight.w500,
    //                 ),
    //               ),
    //               const SizedBox(height: 8),
    //               Text(
    //                 currentFilter.label,
    //                 style: const TextStyle(
    //                   fontSize: 16,
    //                   color: Color(0xFF0F172A),
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const Divider(height: 1),
    //         Expanded(
    //           child: SingleChildScrollView(
    //             padding: const EdgeInsets.all(16),
    //             child: Wrap(
    //               spacing: 8,
    //               runSpacing: 10,
    //               children: currentFilter.options.map((option) {
    //                 final isSelected = currentSelection == option;
    //                 return InkWell(
    //                   borderRadius: BorderRadius.circular(999),
    //                   onTap: () => context.read<FilterBloc>().add(
    //                     SelectOption(currentFilter.id, option),
    //                   ),
    //                   child: Container(
    //                     padding: const EdgeInsets.symmetric(
    //                       horizontal: 16,
    //                       vertical: 8,
    //                     ),
    //                     decoration: BoxDecoration(
    //                       color: isSelected
    //                           ? const Color(0xFFDEEBFF)
    //                           : const Color(0xFFF7FAFC),
    //                       borderRadius: BorderRadius.circular(999),
    //                       border: Border.all(
    //                         width: 1.5,
    //                         color: isSelected
    //                             ? const Color(0xFF0284C7)
    //                             : const Color(0xFFCBD5E1),
    //                       ),
    //                     ),
    //                     child: Text(
    //                       option,
    //                       style: TextStyle(
    //                         fontSize: 13,
    //                         fontWeight: FontWeight.w500,
    //                         color: isSelected
    //                             ? const Color(0xFF0C4A6E)
    //                             : const Color(0xFF334155),
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               }).toList(),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  // }

  // Widget _buildBottomButtons(BuildContext context, FilterState state) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 10,
  //           offset: const Offset(0, -2),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: OutlinedButton(
  //             onPressed: () => 
  //                 context.read<FilterBloc>().add(ClearAllFilters()),
  //             style: OutlinedButton.styleFrom(
  //               padding: const EdgeInsets.symmetric(vertical: 14),
  //               side: const BorderSide(color: Color(0xFF0284C7)),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //             ),
  //             child: const Text(
  //               'എല്ലാം ശൂന്യമാക്കുക',
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w600,
  //                 color: Color(0xFF0284C7),
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: ElevatedButton(
  //             onPressed:
  //                  () => context.read<FilterBloc>().add(NextStep()),
                  
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: const Color(0xFF0284C7),
  //               padding: const EdgeInsets.symmetric(vertical: 14),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               disabledBackgroundColor: Colors.grey.shade300,
  //             ),
  //             child: state.status == FilterStatus.submitting
  //                 ? const SizedBox(
  //                     height: 20,
  //                     width: 20,
  //                     child: CircularProgressIndicator(
  //                       strokeWidth: 2,
  //                       valueColor: 
  //                           AlwaysStoppedAnimation<Color>(Colors.white),
  //                     ),
  //                   )
  //                 :  Text(
  //                   state.isLastStep ?  'ഫിൽട്ടർ പ്രയോഗിക്കുക' :"അടുത്തത്",
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}