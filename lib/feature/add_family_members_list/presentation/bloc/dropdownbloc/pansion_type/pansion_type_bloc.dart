import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pansion_type/pansion_type_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PensionTypeBloc
    extends Bloc<PensionTypeEvent, PensionTypeState> {
  final MemberDropRepository repository;

  PensionTypeBloc(this.repository)
      : super(PensionTypeInitial()) {
    on<FetchPensionTypes>((event, emit) async {
      emit(PensionTypeLoading());
      try {
        final items = await repository.getPensionTypes();
        emit(PensionTypeLoaded(items));
      } catch (e) {
        emit(PensionTypeError(e.toString()));
      }
    });
  }
}
