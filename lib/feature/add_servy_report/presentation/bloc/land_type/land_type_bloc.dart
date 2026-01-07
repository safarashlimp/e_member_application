import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandTypeBloc extends Bloc<LandTypeEvent, LandTypeState> {
  final FamilyDropRepository repository;

  LandTypeBloc(this.repository) : super(LandTypeInitial()) {
    on<FetchLandTypes>(_onFetchLandTypes);
  }

  Future<void> _onFetchLandTypes(
    FetchLandTypes event,
    Emitter<LandTypeState> emit,
  ) async {
    emit(LandTypeLoading());

    try {
      final data = await repository.getLandTypes(); // posistion=3
      emit(LandTypeLoaded(data));
    } catch (e) {
      emit(LandTypeError(e.toString()));
    }
  }
}
