import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RationCardBloc extends Bloc<RationCardEvent, RationCardState> {
  final FamilyDropRepository repository;

  RationCardBloc(this.repository) : super(RationCardInitial()) {
    on<FetchRationCards>(_onFetchRationCards);
  }

  Future<void> _onFetchRationCards(
    FetchRationCards event,
    Emitter<RationCardState> emit,
  ) async {
    emit(RationCardLoading());
    try {
      final items = await repository.rationCardType();
      emit(RationCardLoaded(items));
    } catch (e) {
      emit(RationCardError(e.toString()));
    }
  }
}
