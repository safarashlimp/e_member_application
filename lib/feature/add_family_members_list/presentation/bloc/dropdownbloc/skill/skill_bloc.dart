import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/skill/skill_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final MemberDropRepository repository;

  SkillsBloc(this.repository) : super(SkillsInitial()) {
    on<FetchSkills>((event, emit) async {
      emit(SkillsLoading());
      try {
        final items = await repository.getSkills();
        emit(SkillsLoaded(items));
      } catch (e) {
        emit(SkillsError(e.toString()));
      }
    });
  }
}
