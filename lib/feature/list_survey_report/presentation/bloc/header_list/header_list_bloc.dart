import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
import 'header_list_event.dart';
import 'header_list_state.dart';

class HeaderListBloc extends Bloc<HeaderListEvent, HeaderListState> {
  final GetHeaderListUsecase usecase;

  HeaderListBloc(this.usecase) : super(HeaderListInitial()) {
    on<FetchHeaderList>(_onFetchHeaderList);
  }

  Future<void> _onFetchHeaderList(
    FetchHeaderList event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final clientId = prefs.getString(PrefKeys.clientId);
      final userId = prefs.getString(PrefKeys.userId);

      // 🔴 THIS WAS YOUR ERROR
      if (clientId == null || userId == null) {
        emit(HeaderListError(
            'Session expired. Please login again.'));
        return;
      }

      final items = await usecase(
        clientId,
        userId,
        event.position, // "1"
      );

      emit(HeaderListLoaded(items));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }
}
