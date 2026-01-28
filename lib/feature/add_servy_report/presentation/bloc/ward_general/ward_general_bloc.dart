import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WardGeneralNeedBloc
    extends Bloc<WardGeneralNeedEvent, WardGeneralNeedState> {
  final FamilyDropRepository repository;

  WardGeneralNeedBloc(this.repository) : super(WardGeneralNeedInitial()) {
    on<FetchWardGeneralNeeds>((event, emit) async {
      emit(WardGeneralNeedLoading());
      try {
        final items = await repository.getWardGeneralNeeds();
        emit(WardGeneralNeedLoaded(items));
      } catch (e) {
        emit(WardGeneralNeedError(e.toString()));
      }
    });
  }
}
