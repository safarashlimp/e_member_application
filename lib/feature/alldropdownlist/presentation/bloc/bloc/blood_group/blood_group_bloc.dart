import 'package:e_member_app/feature/alldropdownlist/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/blood_group/blood_group_event.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/blood_group/blood_group_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class BloodGroupBloc extends Bloc<BloodGroupEvent, BloodGroupState> {
  final MemberDropRepository repository;

  BloodGroupBloc(this.repository) : super(BloodGroupInitial()) {
    on<FetchBloodGroups>((event, emit) async {
      emit(BloodGroupLoading());
      try {
        final items = await repository.getBloodGroups();
        emit(BloodGroupLoaded(items));
      } catch (e) {
        emit(BloodGroupError(e.toString()));
      }
    });
  }
}
