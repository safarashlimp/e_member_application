import 'package:bloc/bloc.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_event.dart';
import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_state.dart';
import 'package:e_member_app/feature/add_servy_report/domain/repository/family_drop_repo.dart';



class RequiredBenefitBloc extends Bloc<RequiredBenefitEvent, RequiredBenefitState> {
  final FamilyDropRepository repository;

  RequiredBenefitBloc(this.repository) : super(RequiredBenefitInitial()) {
    on<FetchRequiredBenefits>((event, emit) async {
      emit(RequiredBenefitLoading());
      try {
        final items = await repository.getRequiredBenefits();
        emit(RequiredBenefitLoaded(items: items));
      } catch (e) {
        emit(RequiredBenefitError(message: e.toString()));
      }
    });
  }
}
