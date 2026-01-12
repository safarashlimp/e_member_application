// // import 'package:e_member_app/feature/edit_survey_report/data/repository/edit_survay_report_imp.dart';
// // import 'package:e_member_app/feature/edit_survey_report/domain/getclintid.dart';
// // import 'package:e_member_app/feature/edit_survey_report/presentation/bloc/household/household_event.dart';
// // import 'package:e_member_app/feature/edit_survey_report/presentation/bloc/household/household_state.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class HouseholdSubmitBloc
// //     extends Bloc<HouseholdSubmitEvent, HouseholdSubmitState> {

// //   final HouseholdRepository repository;

// //   HouseholdSubmitBloc(this.repository,) : super(HouseholdInitial()) {

// //     on<SubmitHouseholdEvent>((event, emit) async {
// //       emit(HouseholdSubmitting());

// //       try {
// //         final clientId = await getClientId();

// //         await repository.submitHousehold(
// //           clientId: clientId,
// //           editId: event.editId,
// //           data: event.data,
// //           surveyorId: clientId, // or logged-in userId
// //         );

// //         emit(HouseholdSubmitSuccess());
// //       } catch (e) {
// //         emit(HouseholdSubmitFailure(e.toString()));
// //       }
// //     });
// //   }
// // }
// import 'package:e_member_app/feature/edit_survey_report/data/repository/edit_survay_report_imp.dart';
// import 'package:e_member_app/feature/edit_survey_report/domain/getclintid.dart';
// import 'package:e_member_app/feature/edit_survey_report/presentation/bloc/household/household_event.dart';
// import 'package:e_member_app/feature/edit_survey_report/presentation/bloc/household/household_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HouseholdSubmitBloc
//     extends Bloc<HouseholdSubmitEvent, HouseholdSubmitState> {

//   final HouseholdRepository repository;

//   HouseholdSubmitBloc(householdRepositoryImpl, {required this.repository}) : super(HouseholdInitial()) {

//     on<SubmitHouseholdEvent>((event, emit) async {
//       emit(HouseholdSubmitting());

//       try {
//         final clientId = await getClientId();

//         await repository.submitHousehold(
//           clientId: clientId,
//           editId: event.editId,
//           data: event.data,
//           surveyorId: clientId, // or logged-in userId
//         );

//         emit(HouseholdSubmitSuccess());
//       } catch (e) {
//         emit(HouseholdSubmitFailure(e.toString()));
//       }
//     });
//   }
// }

import 'package:e_member_app/feature/edit_survey_report/data/repository/edit_survay_report_imp.dart';
import 'package:e_member_app/feature/edit_survey_report/domain/getclintid.dart';
import 'package:e_member_app/feature/edit_survey_report/presentation/bloc/household/household_event.dart';
import 'package:e_member_app/feature/edit_survey_report/presentation/bloc/household/household_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HouseholdSubmitBloc extends Bloc<HouseholdSubmitEvent, HouseholdSubmitState> {
  final HouseholdRepository repository;

  HouseholdSubmitBloc({required this.repository}) : super(HouseholdInitial()) {
    on<SubmitHouseholdEvent>((event, emit) async {
      emit(HouseholdSubmitting());

      try {
        final clientId = await getClientId();

        await repository.submitHousehold(
          clientId: clientId,
          editId: event.editId,
          data: event.data,
          // surveyorId: clientId,
        );

        emit(HouseholdSubmitSuccess());
      } catch (e) {
        emit(HouseholdSubmitFailure(e.toString()));
      }
    });
  }
}
