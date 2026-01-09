import 'package:e_member_app/feature/alldropdownlist/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/qualification/qualification_event.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/qualification/qualification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class QualificationBloc
    extends Bloc<QualificationEvent, QualificationState> {
  final MemberDropRepository repository;

  QualificationBloc(this.repository) : super(QualificationInitial()) {
    on<FetchQualifications>((event, emit) async {
      emit(QualificationLoading());
      try {
        final items = await repository.getQualifications();
        emit(QualificationLoaded(items));
      } catch (e) {
        emit(QualificationError(e.toString()));
      }
    });
  }
}
