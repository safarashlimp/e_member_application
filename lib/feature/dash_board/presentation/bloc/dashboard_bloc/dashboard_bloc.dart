import 'package:e_member_app/core/constants/pref_keys.dart';
import 'package:e_member_app/feature/dash_board/domain/usecase/get_dashboard_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardUseCase useCase;

  DashboardBloc(this.useCase) : super(DashboardInitial()) {
    on<LoadDashboardEvent>((event, emit) async {
      emit(DashboardLoading());

      try {
        final pref = await SharedPreferences.getInstance();
        final clientId = pref.getString(PrefKeys.clientId);
        final userId = pref.getString(PrefKeys.userId);

        final data = await useCase(clientId!, userId!);
        emit(DashboardLoaded(data));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    });
  }
}
