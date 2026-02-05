import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/relation_drop/relation_drop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelationDropBloc extends Bloc<RelationDropEvent, RelationDropState> {
  final MemberDropRepository repository;

  RelationDropBloc(this.repository) : super(RelationDropInitial()) {
    on<FetchRelations>((event, emit) async {
      emit(RelationDropLoading());
      try {
        final items = await repository.getRelations();
        emit(RelationDropLoaded(items));
      } catch (e) {
        emit(RelationDropError(e.toString()));
      }
    });
  }
}
