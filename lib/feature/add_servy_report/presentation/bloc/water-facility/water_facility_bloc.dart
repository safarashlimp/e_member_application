import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterFacilityBloc extends Bloc<WaterFacilityEvent, WaterFacilityState> {
  final FamilyDropRepository repository;

  WaterFacilityBloc(this.repository) : super(WaterFacilityInitial()) {
    on<FetchWaterFacilities>(_onFetchWaterFacilities);
  }

  Future<void> _onFetchWaterFacilities(
      FetchWaterFacilities event, Emitter<WaterFacilityState> emit) async {
    emit(WaterFacilityLoading());
    try {
      final data = await repository.getWaterFacilities(); // posistion=4
      emit(WaterFacilityLoaded(data));
    } catch (e) {
      emit(WaterFacilityError(e.toString()));
    }
  }
}
