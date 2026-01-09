import 'package:e_member_app/feature/alldropdownlist/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/marital_status/maritalstatus_event.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/marital_status/maritalstatus_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MaritalStatusBloc
    extends Bloc<MaritalStatusEvent, MaritalStatusState> {
  final MemberDropRepository repository;

  MaritalStatusBloc(this.repository)
      : super(MaritalStatusInitial()) {
    on<FetchMaritalStatus>((event, emit) async {
      emit(MaritalStatusLoading());
      try {
        final items = await repository.getMaritalStatus();
        emit(MaritalStatusLoaded(items));
      } catch (e) {
        emit(MaritalStatusError(e.toString()));
      }
    });
  }
}
