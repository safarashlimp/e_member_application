import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/employment%20support/employment_suppor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmploymentSupportBloc
    extends Bloc<EmploymentSupportEvent, EmploymentSupportState> {
  final MemberDropRepository repository;

  EmploymentSupportBloc(this.repository) : super(EmploymentSupportInitial()) {
    on<FetchEmploymentSupports>((event, emit) async {
      emit(EmploymentSupportLoading());
      try {
        final items = await repository.getEmploymentSupports();
        emit(EmploymentSupportLoaded(items));
      } catch (e) {
        emit(EmploymentSupportError(e.toString()));
      }
    });
  }
}
