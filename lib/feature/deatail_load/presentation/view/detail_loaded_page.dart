// // detail_load_gate.dart
// import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_bloc.dart';
// import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_state.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_basic_details.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_educationdetails.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_health_details.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_job_details.dart';
// import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_sociel_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/mapper/detail_mapper.dart';


// class DetailLoadGate extends StatelessWidget {
//   final String position;
//   final PageMode mode;

//   const DetailLoadGate({
//     super.key,
//     required this.position,
//     required this.mode,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FamilyMemberDetailLoadBloc, FamilyMemberDetailLoadState>(
//       builder: (context, state) {
//         if (state is FamilyMemberDetailLoadLoading) {
//           return const Scaffold( 
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         if (state is FamilyMemberDetailLoadLoaded) {
//           print(position);
//           switch (position) {
//             case '1':
//               final screen1 =
//                   DetailMapper.fromApiToScreen1(state.data);
//               return EditFamilyMemberBasicDetails(
//                 mode: mode,
//                 data: screen1,
//               );

//             case '2':
//               final screen2 =
//                   DetailMapper.fromApiToScreen2(state.data);
//               return EditFamilyMemberEducationdetails(
//                 mode: mode,
//                 data: screen2,
//               );

//             case '3':
//               final screen3 =
//                   DetailMapper.fromApiToScreen3(state.data);
//               return EditFamilyJobDetails(
//                 mode: mode,
//                 data: screen3,
//               );

//             case '4':
//               final screen4 =
//                   DetailMapper.fromApiToScreen4(state.data);
//               return EditFamilyHealthDetails(
//                 mode: mode,
//                 data: screen4,
//               );

//             case '5':
//               final screen5 =
//                   DetailMapper.fromApiToScreen5(state.data);
//               return EditFamilyMemberSocielDetails  (
//                 mode: mode,
//                 data: screen5,
//               );

//             default:
//               return const Scaffold(
//                 body: Center(child: Text('Invalid position')),
//               );
//           }
//         }

//         if (state is FamilyMemberDetailLoadError) {
//           return Scaffold(
//             body: Center(child: Text(state.message)),
//           );
//         }

//         return const Scaffold(body: SizedBox.shrink());
//       },
//     );
//   }
// }
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_bloc.dart';
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_state.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_basic_details.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_educationdetails.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_health_details.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_job_details.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/view/edit_family_member_sociel_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/mapper/detail_mapper.dart';

class DetailLoadGate extends StatelessWidget {
  final String position;
  final PageMode mode;
  final String? editId; // ✅ Add editId parameter

  const DetailLoadGate({
    super.key,
    required this.position,
    required this.mode,
    this.editId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMemberDetailLoadBloc, FamilyMemberDetailLoadState>(
      builder: (context, state) {
        if (state is FamilyMemberDetailLoadLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is FamilyMemberDetailLoadLoaded) {
          print('DetailLoadGate: Position = $position, Data loaded');
          
          // ✅ Build the appropriate screen based on position
          Widget screen;
          
          switch (position) {
            case '1':
              final screen1 = DetailMapper.fromApiToScreen1(state.data);
              screen = EditFamilyMemberBasicDetails(
                mode: mode,
                data: screen1,
                editId: editId, // Pass editId
                position: position, 
               //// Pass position
            
              );
              break;

            case '2':
              final screen2 = DetailMapper.fromApiToScreen2(state.data);
              screen = EditFamilyMemberEducationdetails(
                mode: mode,
                data: screen2,
                editId: editId,
               position: position,
              );
              break;

            case '3':
              final screen3 = DetailMapper.fromApiToScreen3(state.data);
              screen = EditFamilyJobDetails(
                mode: mode,
                data: screen3,
               editId: editId,
              position: position,
              );
              break;

            case '4':
              final screen4 = DetailMapper.fromApiToScreen4(state.data);
              screen = EditFamilyHealthDetails(
                mode: mode,
                data: screen4,
                 editId: editId,
                 position: position,
              );
              break;

            case '5':
              final screen5 = DetailMapper.fromApiToScreen5(state.data);
              screen = EditFamilyMemberSocielDetails(
                mode: mode,
                data: screen5,
                editId: editId,
                position: position,
              );
              break;

            default:
              return const Scaffold(
                body: Center(child: Text('Invalid position')),
              );
          }

          return screen;
        }

        if (state is FamilyMemberDetailLoadError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          );
        }

        return const Scaffold(body: SizedBox.shrink());
      },
    );
  }
}
