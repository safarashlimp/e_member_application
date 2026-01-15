import 'package:bloc/bloc.dart';
import 'package:e_member_app/feature/list_family/domain/user_case/user_case.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_event.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_member_app/core/constants/pref_keys.dart';

class FamilyMemberListBloc
    extends Bloc<FamilyMemberListEvent, FamilyMemberListState> {
  final GetFamilyMemberListUsecase usecase;

  FamilyMemberListBloc(this.usecase) : super(FamilyMemberListInitial()) {
    on<FetchFamilyMemberList>(_onFetchFamilyMemberList);
  }

  Future<void> _onFetchFamilyMemberList(
    FetchFamilyMemberList event,
    Emitter<FamilyMemberListState> emit,
  ) async {
    emit(FamilyMemberListLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final clientId = prefs.getString(PrefKeys.clientId);
           print('PREF clientId => $clientId');
      final userId = prefs.getString(PrefKeys.userId);
print('PREF userId   => $userId');
      // userId not used in API, but still checking session validity

      if (clientId == null || userId == null) {
        emit(
          FamilyMemberListError(
            'Session expired. Please login again.',
          ),
        );
        return;
      }

      final members = await usecase(
        clientId,
        userId,
        event.position,
      );
      print('PREF clientId => $clientId');
print('PREF userId   => $userId');
print('EVENT position=> ${event.position}');

      emit(FamilyMemberListLoaded(members));
    } catch (e) {
      emit(FamilyMemberListError(e.toString()));
    }
  }
}
