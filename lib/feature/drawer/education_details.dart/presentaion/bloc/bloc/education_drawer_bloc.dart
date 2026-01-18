import 'package:e_member_app/feature/drawer/education_details.dart/domain/entity/education_entity.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_event.dart';
import 'package:e_member_app/feature/drawer/education_details.dart/presentaion/bloc/bloc/education_drawer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationDrawerBloc extends Bloc<EducationDrawerEvent, EducationDrawerState> {
  EducationDrawerBloc() : super(const EducationDrawerState()) {
    on<EducationDrawerStepChanged>(_onStepChanged);
    on<EducationDrawerOptionSelected>(_onOptionSelected);
    on<EducationDrawerNextStep>(_onNextStep);
    on<EducationDrawerPreviousStep>(_onPreviousStep);
    on<EducationDrawerReset>(_onReset);
    on<EducationDrawerSubmit>(_onSubmit);
  }

  void _onStepChanged(
    EducationDrawerStepChanged event,
    Emitter<EducationDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < 2) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    EducationDrawerOptionSelected event,
    Emitter<EducationDrawerState> emit,
  ) {
    EducationFilter updatedFilter;
    
    switch (event.filterKey) {
      case 'വിദ്യാഭ്യാസ യോഗ്യത':
        updatedFilter = state.filter.copyWith(
          educationalQualification: event.option,
        );
        break;
      case 'ഇപ്പോൾ പഠിക്കുന്നുണ്ടോ':
        updatedFilter = state.filter.copyWith(
          currentlyStudying: event.option,
        );
        break;
      default:
        return;
    }
    
    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    EducationDrawerNextStep event,
    Emitter<EducationDrawerState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    EducationDrawerPreviousStep event,
    Emitter<EducationDrawerState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    EducationDrawerReset event,
    Emitter<EducationDrawerState> emit,
  ) {
    emit(const EducationDrawerState());
  }

  void _onSubmit(
    EducationDrawerSubmit event,
    Emitter<EducationDrawerState> emit,
  ) {
    emit(state.copyWith(status: EducationDrawerStatus.loading));
    
    try {
      // Here you can add your submission logic
      // For example, save to repository, send to API, etc.
      print('Education Filter: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: EducationDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: EducationDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
