// // import 'package:flutter/material.dart';

// // class AddBasicDetailsFilter extends StatefulWidget {
// //   const AddBasicDetailsFilter({super.key});

// //   @override
// //   State<AddBasicDetailsFilter> createState() => _AddBasicDetailsFilterState();
// // }

// // class _AddBasicDetailsFilterState extends State<AddBasicDetailsFilter> {
// //   int currentStep = 0;
  
// //   // Store selections for each step
// //   final Map<String, String?> selections = {
// //     "വീടിന്റെ തരം": null,
// //     "ഭൂമിയുടെ തരം": null,
// //     " ശൗചാലയം": null,
// //     "വൈദ്യുതി കണക്ഷൻ": null,
// //     "കുടിവെളള സൗകര്യം": null,
// //     "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ": null,
// //     "ലഭിച്ച ആനുകൂല്യം":null,
// //     "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ":null,
// //     "ആവശ്യമുള്ള ആനുകൂല്യം":null,
// //     "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ":null
// //   };

// //   final List<String> steps = [
// //     "വീടിന്റെ തരം",
// //     "ഭൂമിയുടെ തരം",
// //     "ശൗചാലയം",
// //     "വൈദ്യുതി കണക്ഷൻ",
// //     "കുടിവെളള സൗകര്യം",
// //     "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ",
// //     "ലഭിച്ച ആനുകൂല്യം",
// //     "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ",
// //     "ആവശ്യമുള്ള ആനുകൂല്യം"
// //     ,"വാർഡില പൊതുവായ ആവശ്യങ്ങൾ"
// //   ];

// //   final Map<String, List<String>> optionsMap = {
// //     "വീടിന്റെ തരം": ["ഓട് / ഷീറ്റ്", "കോൺക്രീറ്റ്", "ഭൂരഹിതൻ","താൽക്കാലികം "],
// //     "ഭൂമിയുടെ തരം": ["പട്ടയം", "പുറമ്പോക്ക്"],
// //     "ശൗചാലയം": ["ഉണ്ട്", "ഇല്ല"],
// //     "സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
// //     "വൈദ്യുതി കണക്ഷൻ": ["ഉണ്ട്", "ഇല്ല"],
// //     "കുടിവെളള സൗകര്യം" : ["ട്യൂബ് കിണർ","പൊതു പൈപ്പ്" , "മറ്റു മാർഗങ്ങൾ","സ്വന്തം കിണർ"], 
// //     "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ" :  ["ഉണ്ട്", "ഇല്ല"],
// //     "ലഭിച്ച ആനുകൂല്യം": ["പി.എം.എ.വൈ", "മറ്റുള്ളവ","ലൈഫ് മിഷൻ","വീട് അറ്റകുറ്റപ്പണി" ,"സ്ഥലം"],
// //     "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
// //     "ആവശ്യമുള്ള ആനുകൂല്യം": ["ആട്","കുടിവെള്ളം","കോഴി","തൊഴുത്ത്","പതറൾ","മറ്റുള്ളവ","വീട് ","വീട് അറ്റകുറ്റപ്പണി","വൈദ്യുതി കണക്ഷൻ "
// //     "ശൗചാലയം","സ്ഥലം"],
// //     "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ": ["ഡ്രൈനേജ്","പ്ലേറ്റ്","മറ്റുള്ളവ","റോഡ്"]
// //   };

// //   void goToNextStep() {
// //     if (currentStep < steps.length - 1) {
// //       setState(() {
// //         currentStep++;
// //       });
// //     }
// //   }

// //   void goToPreviousStep() {
// //     if (currentStep > 0) {
// //       setState(() {
// //         currentStep--;
// //       });
// //     }
// //   }

// //   void selectOption(String option) {
// //     setState(() {
// //       selections[steps[currentStep]] = option;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final currentStepName = steps[currentStep];
// //     final currentOptions = optionsMap[currentStepName]!;
// //     final currentSelection = selections[currentStepName];

// //     return Drawer(
// //       backgroundColor: Colors.white,
// //       width: MediaQuery.of(context).size.width,
// //       child: SafeArea(
// //         child: Column(
// //           children: [
// //             // ================= HEADER =================
// //             Container(
// //               width: double.infinity,
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [Color(0xFF0277BD), Color(0xFF01579B)],
// //                   begin: Alignment.topLeft,
// //                   end: Alignment.bottomRight,
// //                 ),
// //               ),
// //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
// //               child: Row(
// //                 children: [
// //                   IconButton(
// //                     icon: const Icon(Icons.arrow_back, color: Colors.white),
// //                     onPressed: () => Navigator.pop(context),
// //                   ),
// //                   const Expanded(
// //                     child: Text(
// //                       'വിവരങ്ങൾ ഫിൽറ്റർ ചെയ്യുക',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ),
// //                   IconButton(
// //                     icon: const Icon(Icons.close, color: Colors.white),
// //                     onPressed: () => Navigator.pop(context),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             // ================= BODY =================
// //             Expanded(
// //               child: Row(
// //                 children: [
// //                   // -------- LEFT SECTION (Steps) --------
// //                   Container(
// //                     width: MediaQuery.of(context).size.width * 0.4,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFFF1F5F9),
// //                       border: Border(
// //                         right: BorderSide(
// //                           color: Colors.grey.shade300,
// //                           width: 1,
// //                         ),
// //                       ),
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Section Headers
// //                         Container(
// //                           padding: const EdgeInsets.all(16),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               const Text(
// //                                 'നിർദ്ദേശിച്ച',
// //                                 style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Color(0xFF64748B),
// //                                   fontWeight: FontWeight.w500,
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 4),
// //                               const Text(
// //                                 'ഫിൽട്ടറുകൾ',
// //                                 style: TextStyle(
// //                                   fontSize: 14,
// //                                   color: Color(0xFF334155),
// //                                   fontWeight: FontWeight.w600,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         const Divider(height: 1),
// //                         // Steps List
// //                         Expanded(
// //                           child: ListView.builder(
// //                             padding: EdgeInsets.zero,
// //                             itemCount: steps.length,
// //                             itemBuilder: (context, index) {
// //                               final isSelected = currentStep == index;
// //                               final stepName = steps[index];
// //                               final hasSelection = selections[stepName] != null;

// //                               return InkWell(
// //                                 onTap: () {
// //                                   setState(() {
// //                                     currentStep = index;
// //                                   });
// //                                 },
// //                                 child: Container(
// //                                   padding: const EdgeInsets.symmetric(
// //                                     horizontal: 16,
// //                                     vertical: 14,
// //                                   ),
// //                                   decoration: BoxDecoration(
// //                                     color: isSelected
// //                                         ? const Color(0xFFE0F2FE)
// //                                         : Colors.transparent,
// //                                     border: Border(
// //                                       left: BorderSide(
// //                                         color: isSelected
// //                                             ? const Color(0xFF0284C7)
// //                                             : Colors.transparent,
// //                                         width: 3,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   child: Row(
// //                                     children: [
// //                                       Expanded(
// //                                         child: Text(
// //                                           stepName,
// //                                           style: TextStyle(
// //                                             fontSize: 14,
// //                                             fontWeight: isSelected
// //                                                 ? FontWeight.w600
// //                                                 : FontWeight.w500,
// //                                             color: isSelected
// //                                                 ? const Color(0xFF0C4A6E)
// //                                                 : const Color(0xFF334155),
// //                                           ),
// //                                         ),
// //                                       ),
// //                                       if (hasSelection)
// //                                         Container(
// //                                           width: 8,
// //                                           height: 8,
// //                                           decoration: const BoxDecoration(
// //                                             color: Color(0xFF0284C7),
// //                                             shape: BoxShape.circle,
// //                                           ),
// //                                         ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   // -------- RIGHT SECTION (Options) --------
// //                   Expanded(
// //                     child: Container(
// //                       color: Colors.white,
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           // Section Title
// //                           Container(
// //                             padding: const EdgeInsets.all(16),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 const Text(
// //                                   'നിർദ്ദേശിച്ച ഫിൽട്ടറുകൾ',
// //                                   style: TextStyle(
// //                                     fontSize: 12,
// //                                     color: Color(0xFF64748B),
// //                                     fontWeight: FontWeight.w500,
// //                                   ),
// //                                 ),
// //                                 const SizedBox(height: 8),
// //                                 Text(
// //                                   currentStepName,
// //                                   style: const TextStyle(
// //                                     fontSize: 16,
// //                                     color: Color(0xFF0F172A),
// //                                     fontWeight: FontWeight.w600,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           const Divider(height: 1),
// //                           // Options
// //                           Expanded(
// //                             child: SingleChildScrollView(
// //                               padding: const EdgeInsets.all(16),
// //                               child: Wrap(
// //                                 spacing: 8,
// //                                 runSpacing: 10,
// //                                 children: currentOptions.map((option) {
// //                                   final isSelected = currentSelection == option;
// //                                   return InkWell(
// //                                     borderRadius: BorderRadius.circular(999),
// //                                     onTap: () => selectOption(option),
// //                                     child: Container(
// //                                       padding: const EdgeInsets.symmetric(
// //                                         horizontal: 16,
// //                                         vertical: 8,
// //                                       ),
// //                                       decoration: BoxDecoration(
// //                                         color: isSelected
// //                                             ? const Color(0xFFDEEBFF)
// //                                             : const Color(0xFFF7FAFC),
// //                                         borderRadius: BorderRadius.circular(999),
// //                                         border: Border.all(
// //                                           width: 1.5,
// //                                           color: isSelected
// //                                               ? const Color(0xFF0284C7)
// //                                               : const Color(0xFFCBD5E1),
// //                                         ),
// //                                       ),
// //                                       child: Text(
// //                                         option,
// //                                         style: TextStyle(
// //                                           fontSize: 13,
// //                                           fontWeight: FontWeight.w500,
// //                                           color: isSelected
// //                                               ? const Color(0xFF0C4A6E)
// //                                               : const Color(0xFF334155),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   );
// //                                 }).toList(),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             // ================= BOTTOM BUTTONS =================
// //             Container(
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.05),
// //                     blurRadius: 10,
// //                     offset: const Offset(0, -2),
// //                   ),
// //                 ],
// //               ),
// //               child: Row(
// //                 children: [
// //                   // Previous/Cancel Button
// //                   Expanded(
// //                     child: OutlinedButton(
// //                       onPressed: currentStep > 0 ? goToPreviousStep : null,
// //                       style: OutlinedButton.styleFrom(
// //                         padding: const EdgeInsets.symmetric(vertical: 14),
// //                         side: BorderSide(
// //                           color: currentStep > 0
// //                               ? const Color(0xFF0284C7)
// //                               : Colors.grey.shade300,
// //                         ),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                       ),
// //                       child: Text(
// //                         currentStep > 0 ? 'എല്ലാം ശൂന്യമാക്കുക' : 'എല്ലാം ശൂന്യമാക്കുക',
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w600,
// //                           color: currentStep > 0
// //                               ? const Color(0xFF0284C7)
// //                               : Colors.grey.shade400,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(width: 12),
// //                   // Next/Submit Button
// //                   Expanded(
// //                     child: ElevatedButton(
// //                       onPressed: currentSelection != null
// //                           ? (currentStep < steps.length - 1
// //                               ? goToNextStep
// //                               : () {
// //                                   // Submit logic
// //                                   print('Selections: $selections');
// //                                   Navigator.pop(context);
// //                                 })
// //                           : null,
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color(0xFF0284C7),
// //                         padding: const EdgeInsets.symmetric(vertical: 14),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                         disabledBackgroundColor: Colors.grey.shade300,
// //                       ),
// //                       child: Text(
// //                         currentStep < steps.length - 1
// //                             ? 'ഫിൽട്ടർ പ്രയോഗിക്കുക'
// //                             : 'ഫിൽട്ടർ പ്രയോഗിക്കുക',
// //                         style: const TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w600,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';

// class AddBasicDetailsFilter extends StatefulWidget {
//   const AddBasicDetailsFilter({super.key});

//   @override
//   State<AddBasicDetailsFilter> createState() => _AddBasicDetailsFilterState();
// }

// class _AddBasicDetailsFilterState extends State<AddBasicDetailsFilter> {
//   int currentStep = 0;
  
//   // Store selections for each step
//   final Map<String, String?> selections = {
//     "വീടിന്റെ തരം": null,
//     "ഭൂമിയുടെ തരം": null,
//     "ശൗചാലയം": null,
//     "വൈദ്യുതി കണക്ഷൻ": null,
//     "കുടിവെളള സൗകര്യം": null,
//     "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ": null,
//     "ലഭിച്ച ആനുകൂല്യം": null,
//     "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ": null,
//     "ആവശ്യമുള്ള ആനുകൂല്യം": null,
//     "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ": null
//   };

//   final List<String> steps = [
//     "വീടിന്റെ തരം",
//     "ഭൂമിയുടെ തരം",
//     "ശൗചാലയം",
//     "വൈദ്യുതി കണക്ഷൻ",
//     "കുടിവെളള സൗകര്യം",
//     "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ",
//     "ലഭിച്ച ആനുകൂല്യം",
//     "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ",
//     "ആവശ്യമുള്ള ആനുകൂല്യം",
//     "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ"
//   ];

//   final Map<String, List<String>> optionsMap = {
//     "വീടിന്റെ തരം": ["ഓട് / ഷീറ്റ്", "കോൺക്രീറ്റ്", "ഭൂരഹിതൻ", "താൽക്കാലികം"],
//     "ഭൂമിയുടെ തരം": ["പട്ടയം", "പുറമ്പോക്ക്"],
//     "ശൗചാലയം": ["ഉണ്ട്", "ഇല്ല"],
//     "വൈദ്യുതി കണക്ഷൻ": ["ഉണ്ട്", "ഇല്ല"],
//     "കുടിവെളള സൗകര്യം": ["ട്യൂബ് കിണർ", "പൊതു പൈപ്പ്", "മറ്റു മാർഗങ്ങൾ", "സ്വന്തം കിണർ"],
//     "നിലവിൽ വീടിന് ആനുകൂല്യങ്ങൾ ലഭിച്ചിട്ടുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
//     "ലഭിച്ച ആനുകൂല്യം": ["പി.എം.എ.വൈ", "മറ്റുള്ളവ", "ലൈഫ് മിഷൻ", "വീട് അറ്റകുറ്റപ്പണി", "സ്ഥലം"],
//     "ആനുകൂല്യങ്ങൾ ആവശ്യമുണ്ടോ": ["ഉണ്ട്", "ഇല്ല"],
//     "ആവശ്യമുള്ള ആനുകൂല്യം": [
//       "ആട്",
//       "കുടിവെള്ളം",
//       "കോഴി",
//       "തൊഴുത്ത്",
//       "പതറൾ",
//       "മറ്റുള്ളവ",
//       "വീട്",
//       "വീട് അറ്റകുറ്റപ്പണി",
//       "വൈദ്യുതി കണക്ഷൻ",
//       "ശൗചാലയം",
//       "സ്ഥലം"
//     ],
//     "വാർഡില പൊതുവായ ആവശ്യങ്ങൾ": ["ഡ്രൈനേജ്", "പ്ലേറ്റ്", "മറ്റുള്ളവ", "റോഡ്"]
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
//                           child: const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'നിർദ്ദേശിച്ച',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF64748B),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
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
//                         'എല്ലാം ശൂന്യമാക്കുക',
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
//                       child: const Text(
//                         'ഫിൽട്ടർ പ്രയോഗിക്കുക',
//                         style: TextStyle(
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
// ==================== UI FILE (add_basic_details_filter.dart) ====================
import 'package:e_member_app/feature/drawer/add_basic_details/data/model/filter_add_basic..dart';
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
      create: (context) => AddBasicFilter(steps: FilterData.basicDetailsSteps),
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
        return Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
                // ================= HEADER =================
                _buildHeader(context),

                // ================= BODY =================
                Expanded(
                  child: Row(
                    children: [
                      // -------- LEFT SECTION (Steps) --------
                      _buildLeftSection(context, state),

                      // -------- RIGHT SECTION (Options) --------
                      _buildRightSection(context, state),
                    ],
                  ),
                ),

                // ================= BOTTOM BUTTONS =================
                _buildBottomButtons(context, state),
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
                final stepName = state.steps[index].name;
                final hasSelection = state.selections[stepName] != null;

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
                    final isSelected = state.currentSelection == option;
                    return InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () {
                        context.read<AddBasicFilter>().add(
                              SelectOptionEvent(state.currentStepName, option),
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

  Widget _buildBottomButtons(BuildContext context, FilterStateAddBasic state) {
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
}