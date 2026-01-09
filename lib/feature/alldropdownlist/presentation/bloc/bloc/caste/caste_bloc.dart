import 'package:e_member_app/feature/alldropdownlist/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/caste/caste_event.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/caste/caste_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CasteBloc extends Bloc<CasteEvent, CasteState> {
  final MemberDropRepository repository;

  CasteBloc(this.repository) : super(CasteInitial()) {
    on<FetchCastes>((event, emit) async {
      emit(CasteLoading());
      try {
        final items = await repository.getCastes();
        emit(CasteLoaded(items));
      } catch (e) {
        emit(CasteError(e.toString()));
      }
    });
  }
}
