import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/dropdownrepo/member_drop_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'health_insurance_event.dart';
part 'health_insurance_state.dart';

class HealthInsuranceBloc
    extends Bloc<HealthInsuranceEvent, HealthInsuranceState> {
  final MemberDropRepository repository;

  HealthInsuranceBloc(this.repository) : super(HealthInsuranceInitial()) {
    on<FetchHealthInsurance>((event, emit) async {
      emit(HealthInsuranceLoading());
      try {
        final items = await repository.getHealthInsurance();
        emit(HealthInsuranceLoaded(items));
      } catch (e) {
        emit(HealthInsuranceError(e.toString()));
      }
    });
  }
}
