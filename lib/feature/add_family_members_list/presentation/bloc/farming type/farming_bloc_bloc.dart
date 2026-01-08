import 'package:e_member_app/feature/add_family_members_list/domain/repository/member_drop_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/farming%20type/farming_bloc_event.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/farming%20type/farming_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class FarmingTypeBloc
    extends Bloc<FarmingTypeEvent, FarmingTypeState> {
  final MemberDropRepository repository;

  FarmingTypeBloc(this.repository)
      : super(FarmingTypeInitial()) {
    on<FetchFarmingTypes>((event, emit) async {
      emit(FarmingTypeLoading());
      try {
        final items = await repository.getFarmingTypes();
        emit(FarmingTypeLoaded(items));
      } catch (e) {
        emit(FarmingTypeError(e.toString()));
      }
    });
  }
}
