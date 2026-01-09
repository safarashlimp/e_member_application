import 'package:e_member_app/feature/alldropdownlist/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/pension_required/pension_required_event.dart';
import 'package:e_member_app/feature/alldropdownlist/presentation/bloc/bloc/pension_required/pension_required_state.dart';
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
