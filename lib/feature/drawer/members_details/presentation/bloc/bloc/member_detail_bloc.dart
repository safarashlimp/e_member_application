import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_details_filter.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/bloc/bloc/member_detail_event.dart';
import 'package:e_member_app/feature/drawer/members_details/presentation/bloc/bloc/member_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberDetailsBloc extends Bloc<MemberDetailsEvent, MemberDetailsState> {
  MemberDetailsBloc() : super(const MemberDetailsState()) {
    on<MemberDetailsStepChanged>(_onStepChanged);
    on<MemberDetailsOptionSelected>(_onOptionSelected);
    on<MemberDetailsNextStep>(_onNextStep);
    on<MemberDetailsPreviousStep>(_onPreviousStep);
    on<MemberDetailsReset>(_onReset);
    on<MemberDetailsSubmit>(_onSubmit);
  }

  void _onStepChanged(
    MemberDetailsStepChanged event,
    Emitter<MemberDetailsState> emit,
  ) {
    if (event.step >= 0 && event.step < 5) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    MemberDetailsOptionSelected event,
    Emitter<MemberDetailsState> emit,
  ) {
    MemberDetailsFilter updatedFilter;
    
    switch (event.filterKey) {
      case 'രക്തഗ്രൂപ്പ്':
        updatedFilter = state.filter.copyWith(bloodGroup: event.option);
        break;
      case 'ലിംഗം':
        updatedFilter = state.filter.copyWith(gender: event.option);
        break;
      case 'വിവാഹസ്ഥിതി':
        updatedFilter = state.filter.copyWith(maritalStatus: event.option);
        break;
      case 'മതം':
        updatedFilter = state.filter.copyWith(religion: event.option);
        break;
      case 'ജാതി':
        updatedFilter = state.filter.copyWith(caste: event.option);
        break;
      default:
        return;
    }
    
    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    MemberDetailsNextStep event,
    Emitter<MemberDetailsState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    MemberDetailsPreviousStep event,
    Emitter<MemberDetailsState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    MemberDetailsReset event,
    Emitter<MemberDetailsState> emit,
  ) {
    emit(const MemberDetailsState());
  }

  void _onSubmit(
    MemberDetailsSubmit event,
    Emitter<MemberDetailsState> emit,
  ) {
    emit(state.copyWith(status: MemberDetailsStatus.loading));
    
    try {
      // Here you can add your submission logic
      // For example, save to repository, send to API, etc.
      print('Member Details Filter: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: MemberDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: MemberDetailsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}