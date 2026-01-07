
import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OtherBenefitBloc extends Bloc<OtherBenefitEvent, OtherBenefitState> {
  final FamilyDropRepository repository;

  OtherBenefitBloc(this.repository) : super(OtherBenefitInitial()) {
    on<FetchOtherBenefits>((event, emit) async {
      emit(OtherBenefitLoading());
      try {
        final items = await repository.getOtherBenefits();
        emit(OtherBenefitLoaded(items));
      } catch (e) {
        emit(OtherBenefitError(e.toString()));
      }
    });
  }
}
