import 'package:e_member_app/feature/add_family_members_list/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/bloc/employment_status_dart_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/bloc/employment_status_dart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class EmploymentStatusBloc
    extends Bloc<EmploymentStatusEvent, EmploymentStatusState> {
  final MemberDropRepository repository;

  EmploymentStatusBloc(this.repository)
      : super(EmploymentStatusInitial()) {
    on<FetchEmploymentStatus>((event, emit) async {
      emit(EmploymentStatusLoading());
      try {
        final items = await repository.getEmploymentStatus();
        emit(EmploymentStatusLoaded(items));
      } catch (e) {
        emit(EmploymentStatusError(e.toString()));
      }
    });
  }
}
