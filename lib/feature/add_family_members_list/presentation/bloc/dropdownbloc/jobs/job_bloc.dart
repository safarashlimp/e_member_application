import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final MemberDropRepository repository;

  JobBloc(this.repository) : super(JobInitial()) {
    on<FetchJobs>((event, emit) async {
      emit(JobLoading());
      try {
        final items = await repository.getJobs();
        emit(JobLoaded(items));
      } catch (e) {
        emit(JobError(e.toString()));
      }
    });
  }
}
