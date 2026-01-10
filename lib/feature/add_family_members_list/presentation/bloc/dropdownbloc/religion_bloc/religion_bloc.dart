import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/religion_bloc/religion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReligionBloc extends Bloc<ReligionEvent, ReligionState> {
  final MemberDropRepository repository;

 ReligionBloc(this.repository) : super( ReligionInitial()) {
    on<FetchReligion>((event, emit) async {
      emit( ReligionLoading());
      try {
        final items = await repository.getReligion();
        emit( ReligionLoaded(items));
      } catch (e) {
        emit( ReligionError(e.toString()));
      }
    });
  }
}