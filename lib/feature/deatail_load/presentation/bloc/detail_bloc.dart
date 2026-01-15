import 'package:e_member_app/feature/deatail_load/data/repository/detail_repository.dart';
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_event.dart';
import 'package:e_member_app/feature/deatail_load/presentation/bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



class FamilyMemberDetailLoadBloc extends Bloc<FamilyMemberDetailLoadEvent, FamilyMemberDetailLoadState> {
  final FamilyMemberDetailsLoadRepository repository;

  FamilyMemberDetailLoadBloc(this.repository) : super(FamilyMemberDetailLoadInitial()) {
    on<FetchDetailLoad>((event, emit) async {
      emit(FamilyMemberDetailLoadLoading());

      try {
        final pref = await SharedPreferences.getInstance();
        final clientId = pref.getString('clientId') ?? '';

        final data = await repository.fetchDetails(
          clientId: clientId,
          position: event.position,
          editId: event.editId,
        );

        emit(FamilyMemberDetailLoadLoaded(data));
      } catch (e) {
        emit(FamilyMemberDetailLoadError(e.toString()));
      }
    });
  }
}
