import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_event.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthDrawerBloc extends Bloc<HealthDrawerEvent, HealthDrawerState> {
  HealthDrawerBloc() : super(const HealthDrawerState()) {
    on<HealthDrawerStepChanged>(_onStepChanged);
    on<HealthDrawerOptionSelected>(_onOptionSelected);
    on<HealthDrawerNextStep>(_onNextStep);
    on<HealthDrawerPreviousStep>(_onPreviousStep);
    on<HealthDrawerReset>(_onReset);
    on<HealthDrawerSubmit>(_onSubmit);
  }

  void _onStepChanged(
    HealthDrawerStepChanged event,
    Emitter<HealthDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < 5) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    HealthDrawerOptionSelected event,
    Emitter<HealthDrawerState> emit,
  ) {
    HealthDrawerFilter updatedFilter;
    
    switch (event.filterKey) {
      case 'രോഗിയാണോ':
        updatedFilter = state.filter.copyWith(isPatient: event.option);
        break;
      case 'ഭിന്നശേഷിയുണ്ടോ':
        updatedFilter = state.filter.copyWith(hasDisability: event.option);
        break;
      case 'സർക്കാർ ആനുകൂല്യങ്ങൾ ലഭിക്കുന്നുണ്ടോ':
        updatedFilter = state.filter.copyWith(receivesGovernmentBenefits: event.option);
        break;
      case 'ഹെൽത്ത് ഇൻഷൂറൻസ് കാർഡ് ഉണ്ടോ':
        updatedFilter = state.filter.copyWith(hasHealthInsurance: event.option);
        break;
      case 'ആവശ്യമായ ആരോഗ്യ സഹായങ്ങൾ':
        updatedFilter = state.filter.copyWith(requiredHealthAssistance: event.option);
        break;
      default:
        return;
    }
    
    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    HealthDrawerNextStep event,
    Emitter<HealthDrawerState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    HealthDrawerPreviousStep event,
    Emitter<HealthDrawerState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    HealthDrawerReset event,
    Emitter<HealthDrawerState> emit,
  ) {
    emit(const HealthDrawerState());
  }

  void _onSubmit(
    HealthDrawerSubmit event,
    Emitter<HealthDrawerState> emit,
  ) {
    emit(state.copyWith(status: HealthDrawerStatus.loading));
    
    try {
      // Here you can add your submission logic
      // For example, save to repository, send to API, etc.
      print('Health Drawer Filter: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: HealthDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: HealthDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}