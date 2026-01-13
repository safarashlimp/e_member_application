  import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_state.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  class HouseTypeBloc extends Bloc<HouseTypeEvent, HouseTypeState> {
    final FamilyDropRepository repository;

    HouseTypeBloc(this.repository) : super(HouseTypeInitial()) {
      on<FetchHouseTypes>(_onFetchHouseTypes);
    }

    Future<void> _onFetchHouseTypes(
      FetchHouseTypes event,
      Emitter<HouseTypeState> emit,
    ) async {
      emit(HouseTypeLoading());

      try {
        final data = await repository.getHouseTypes();
        emit(HouseTypeLoaded(data));
      } catch (e) {
        emit(HouseTypeError(e.toString()));
      }
    }
  }
