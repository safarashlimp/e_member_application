import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'header_load_event.dart';
import 'header_load_state.dart';
import '../../data/repository/header_load_repository.dart';

class HeaderLoadBloc extends Bloc<HeaderLoadEvent, HeaderLoadState> {
  final HeaderLoadRepository repository;

  HeaderLoadBloc(this.repository) : super(HeaderLoadInitial()) {
    on<FetchHeaderLoad>((event, emit) async {
      emit(HeaderLoadLoading());

      try {
        final pref = await SharedPreferences.getInstance();
        final clientId = pref.getString('clientId') ?? '';

        final data = await repository.fetchHeader(
          clientId: clientId,
          position: event.position,
          editId: event.editId,
          
        );

        emit(HeaderLoadLoaded(data));
      } catch (e) {
        emit(HeaderLoadError(e.toString()));
      }
    });
  }
}