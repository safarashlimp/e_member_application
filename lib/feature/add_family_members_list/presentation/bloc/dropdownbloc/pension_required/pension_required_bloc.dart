import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/dropdownbloc/pension_required/pension_required_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class PensionRequiredBloc
    extends Bloc<PensionRequiredEvent, PensionRequiredState> {
  final MemberDropRepository repository;

  PensionRequiredBloc(this.repository)
      : super(PensionRequiredInitial()) {
    on<FetchPensionRequirement>((event, emit) async {
      emit(PensionRequiredLoading());
      try {
        final items = await repository.getPensionRequirement();
        emit(PensionRequiredLoaded(items));
      } catch (e) {
        emit(PensionRequiredError(e.toString()));
      }
    });
  }
}
