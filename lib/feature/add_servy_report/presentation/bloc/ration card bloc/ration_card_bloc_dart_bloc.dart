// lib/feature/add_servy_report/presentation/bloc/ration_card/ration_card_bloc.dart

import 'package:e_member_app/feature/add_servy_report/data/model/ration_card_model.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/ration_card_repository.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ration%20card%20bloc/ration_card_bloc_dart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RationCardBloc extends Bloc<RationCardEvent, RationCardState> {
  final RationCardRepository repository;

  RationCardBloc({required this.repository}) : super(RationCardInitial()) {
    on<FetchRationCards>((event, Emitter<RationCardState> emit) async {
      emit(RationCardLoading());
      try {
        final List<RationCard> cards = await repository.fetchRationCards();
        emit(RationCardLoaded(rationCards: cards,));
      } catch (e) {
        emit(RationCardError(message: e.toString()));
      }
    });
  }
}