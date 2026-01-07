// lib/feature/add_servy_report/presentation/bloc/ration_card/ration_card_bloc.dart

import 'package:e_member_app/feature/add_servy_report/data/repository/ration_card_repository.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RationCardBloc extends Bloc<RationCardEvent, RationCardState> {
  final RationCardRepository repository;

  RationCardBloc(this.repository) : super(RationCardInitial()) {
    on<FetchRationCards>(_onFetch);
    on<SelectRationCard>(_onSelect);
  }

  Future<void> _onFetch(
    FetchRationCards event,
    Emitter<RationCardState> emit,
  ) async {
    emit(RationCardLoading());
    try {
      final cards = await repository.fetchRationCards();
      emit(RationCardLoaded(rationCards: cards));
    } catch (e) {
      emit(RationCardError(e.toString()));
    }
  }

  void _onSelect(
    SelectRationCard event,
    Emitter<RationCardState> emit,
  ) {
    if (state is RationCardLoaded) {
      final current = state as RationCardLoaded;
      emit(current.copyWith(selectedCardId: event.selectedId));
    }
  }
}
