import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final MemberDropRepository repository;

  EducationBloc(this.repository) : super(EducationInitial()) {
    on<FetchEducation>((event, emit) async {
      emit(EducationLoading());
      try {
        final items = await repository.getEducationList();
        emit(EducationLoaded(items));
      } catch (e) {
        emit(EducationError(e.toString()));
      }
    });
  }
}
