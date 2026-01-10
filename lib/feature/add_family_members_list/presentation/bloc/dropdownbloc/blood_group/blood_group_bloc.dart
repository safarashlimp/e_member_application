import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/blood_group/blood_group_state.dart';
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
