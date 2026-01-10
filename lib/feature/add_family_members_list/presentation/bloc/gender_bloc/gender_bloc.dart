import 'package:e_member_app/feature/add_family_members_list/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/gender_bloc/gender_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/gender_bloc/gender_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final MemberDropRepository repository;

  GenderBloc(this.repository) : super(GenderInitial()) {
    on<FetchGender>((event, emit) async {
      emit(GenderLoading());
      try {
        final items = await repository.getGender();
        emit(GenderLoaded(items));
      } catch (e) {
        emit(GenderError(e.toString()));
      }
    });
  }
}