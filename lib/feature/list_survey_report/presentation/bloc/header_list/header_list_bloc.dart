// import 'package:bloc/bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:e_member_app/core/constants/pref_keys.dart';
// import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
// import 'header_list_event.dart';
// import 'header_list_state.dart';

// class HeaderListBloc extends Bloc<HeaderListEvent, HeaderListState> {
//   final GetHeaderListUsecase usecase;

//   HeaderListBloc(this.usecase) : super(HeaderListInitial()) {
//     on<FetchHeaderList>(_onFetchHeaderList);
//   }

//   Future<void> _onFetchHeaderList(
//     FetchHeaderList event,
//     Emitter<HeaderListState> emit,
//   ) async {
//     emit(HeaderListLoading());

//     try {
//       final prefs = await SharedPreferences.getInstance();

//       final clientId = prefs.getString(PrefKeys.clientId);
//       final userId = prefs.getString(PrefKeys.userId);

//       // 🔴 THIS WAS YOUR ERROR
//       if (clientId == null || userId == null) {
//         emit(HeaderListError(
//             'Session expired. Please login again.'));
//         return;
//       }

//       final items = await usecase(
//         clientId,
//         userId,
//         event.position, 
//       );

//       emit(HeaderListLoaded(items));
//     } catch (e) {
//       emit(HeaderListError(e.toString()));
//     }
//   }
// }
//
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_state.dart';

class HeaderListBloc extends Bloc<HeaderListEvent, HeaderListState> {
  final GetHeaderListUsecase getHeaderListUsecase;

  HeaderListBloc(this.getHeaderListUsecase) : super(HeaderListInitial()) {
    on<FetchHeaderList>(_onFetchHeaderList);
    on<ApplyFilters>(_onApplyFilters);
    on<ClearFilters>(_onClearFilters);
  }

  Future<void> _onFetchHeaderList(
    FetchHeaderList event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());
    
    try {
      final items = await getHeaderListUsecase(
        event.position,
        filters: event.filters,
      );
      emit(HeaderListLoaded(items));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }

  Future<void> _onApplyFilters(
    ApplyFilters event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());
    
    try {
      print('🔍 Applying filters: ${event.filters}');
      final items = await getHeaderListUsecase(
        event.position,
        filters: event.filters,
      );
      emit(HeaderListLoaded(items, appliedFilters: event.filters));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }

  Future<void> _onClearFilters(
    ClearFilters event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());
    
    try {
      final items = await getHeaderListUsecase(event.position);
      emit(HeaderListLoaded(items));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }
}