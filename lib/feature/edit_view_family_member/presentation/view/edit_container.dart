// import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
// import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
// import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
// import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
// import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';
// import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_3rdpage_repository.dart';
// import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_4thpage_repository.dart';
// import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_5thpage_repository.dart';
// import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_details_secondpage_repository.dart';
// import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_firstpage_details_repository.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_bloc.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_basic_details.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_educationdetails.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_health_details.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_job_details.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_sociel_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EditFamilyMemberContainer extends StatefulWidget {
//   final String clientId;
//   final int familyMemberId;

//   const EditFamilyMemberContainer({
//     required this.clientId,
//     required this.familyMemberId,
//   });

//   @override
//   State<EditFamilyMemberContainer> createState() =>
//       _EditFamilyMemberContainerState();
// }

// class _EditFamilyMemberContainerState extends State<EditFamilyMemberContainer>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
  
//   // Data models for all 5 screens
//   PersonalDetailsModel? personalData;
//   EducationResponse? educationData;
//   EmploymentResponse? employmentData;
//   HealthResponse? healthData;
//   WelfareResponse? welfareData;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//     _loadAllData();
//   }

//   Future<void> _loadAllData() async {
//     // Fetch all data from your repositories or API
//     try {
//       final personalRepo = FamilyMemberRepository();
//       final educationRepo = EducationDetailsRepository();
//       final employmentRepo = EmploymentDetailsRepository();
//       final healthRepo = HealthDetailsRepository();
//       final pensionRepo = PensionDetailsRepository();

//       // Load data from API - adjust based on your API structure
//       setState(() async {
//         // personalData = await personalRepo.submitFamilyMember(widget.familyMemberId);
//         // educationData = await educationRepo.getEducation(widget.familyMemberId);
//        // etc...
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading data: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => EditFamilyMemberBloc(
//         familyMemberRepository: FamilyMemberRepository(),
//         educationRepository: EducationDetailsRepository(),
//         employmentRepository: EmploymentDetailsRepository(),
//         healthRepository: HealthDetailsRepository(),
//         pensionRepository: PensionDetailsRepository(),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Edit Family Member'),
//           bottom: TabBar(
//             controller: _tabController,
//             tabs: [
//               Tab(text: 'Personal'),
//               Tab(text: 'Education'),
//               Tab(text: 'Employment'),
//               Tab(text: 'Health'),
//               Tab(text: 'Welfare'),
//             ],
//           ),
//         ),
//         body: personalData == null
//             ? Center(child: CircularProgressIndicator())
//             : TabBarView(
//                 controller: _tabController,
//                 children: [
//                   EditFamilyMemberBasicDetails(
//                     mode: PageMode.edit,
//                     data: personalData!,
//                   ),
//                   EditFamilyMemberEducationdetails(
//                     mode: PageMode.edit,
//                     data: educationData!,
//                   ),
//                   EditFamilyJobDetails(
//                     mode: PageMode.edit,
//                     data: employmentData!,
//                   ),
//                   EditFamilyHealthDetails(
//                     mode: PageMode.edit,
//                     data: healthData!,
//                   ),
//                   EditFamilyMemberSocielDetails(
//                     mode: PageMode.edit,
//                     data: welfareData!,
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }