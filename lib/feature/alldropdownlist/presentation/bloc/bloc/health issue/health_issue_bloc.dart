import 'package:e_member_app/feature/alldropdownlist/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/health%20issue/health_issue_event.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/health%20issue/health_issue_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HealthIssueBloc
    extends Bloc<HealthIssueEvent, HealthIssueState> {
  final MemberDropRepository repository;

  HealthIssueBloc(this.repository)
      : super(HealthIssueInitial()) {
    on<FetchHealthIssues>((event, emit) async {
      emit(HealthIssueLoading());
      try {
        final items = await repository.getHealthIssues();
        emit(HealthIssueLoaded(items));
      } catch (e) {
        emit(HealthIssueError(e.toString()));
      }
    });
  }
}
