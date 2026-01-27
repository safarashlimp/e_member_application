import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/required_health/requried_health_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequiredHealthSupportBloc
    extends Bloc<RequiredHealthSupportEvent, RequiredHealthSupportState> {
  final MemberDropRepository repository;

  RequiredHealthSupportBloc(this.repository)
      : super(RequiredHealthSupportInitial()) {
    on<FetchRequiredHealthSupports>((event, emit) async {
      emit(RequiredHealthSupportLoading());
      try {
        final items = await repository.getRequiredHealthSupports();
        emit(RequiredHealthSupportLoaded(items));
      } catch (e) {
        emit(RequiredHealthSupportError(e.toString()));
      }
    });
  }
}
