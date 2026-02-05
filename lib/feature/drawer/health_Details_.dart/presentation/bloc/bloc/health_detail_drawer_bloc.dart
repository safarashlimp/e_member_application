// lib/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_bloc.dart

import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/entity/health_drawer_filter.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/domain/repo/health_drawer_repo.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_event.dart';
import 'package:e_member_app/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthDrawerBloc extends Bloc<HealthDrawerEvent, HealthDrawerState> {
  final HealthDrawerRepository _repository;

  HealthDrawerBloc(this._repository) : super(const HealthDrawerState()) {
    on<HealthDrawerInitialize>(_onInitialize);
    on<HealthDrawerStepChanged>(_onStepChanged);
    on<HealthDrawerOptionSelected>(_onOptionSelected);
    on<HealthDrawerNextStep>(_onNextStep);
    on<HealthDrawerPreviousStep>(_onPreviousStep);
    on<HealthDrawerReset>(_onReset);
    on<HealthDrawerSubmit>(_onSubmit);
  }

  Future<void> _onInitialize(
    HealthDrawerInitialize event,
    Emitter<HealthDrawerState> emit,
  ) async {
    emit(state.copyWith(status: HealthDrawerStatus.loading));

    try {
      final steps = await _repository.getAllHealthSteps();
      emit(state.copyWith(
        status: HealthDrawerStatus.loaded,
        steps: steps,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HealthDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onStepChanged(
    HealthDrawerStepChanged event,
    Emitter<HealthDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < state.steps.length) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    HealthDrawerOptionSelected event,
    Emitter<HealthDrawerState> emit,
  ) {
    HealthDrawerFilter updatedFilter;

    switch (event.stepIndex) {
      case 0: // രോഗിയാണോ
        updatedFilter = state.filter.copyWith(isPatient: event.optionId);
        break;
      case 1: // ഭിന്നശേഷിയുണ്ടോ
        updatedFilter = state.filter.copyWith(hasDisability: event.optionId);
        break;
      case 2: // സർക്കാർ ആനുകൂല്യങ്ങൾ
        updatedFilter =
            state.filter.copyWith(receivesGovernmentBenefits: event.optionId);
        break;
      case 3: // ഹെൽത്ത് ഇൻഷൂറൻസ്
        updatedFilter =
            state.filter.copyWith(hasHealthInsurance: event.optionId);
        break;
      case 4: // ആരോഗ്യ സഹായങ്ങൾ
        updatedFilter =
            state.filter.copyWith(requiredHealthAssistance: event.optionId);
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
    emit(state.copyWith(
      filter: const HealthDrawerFilter(),
      currentStep: 0,
    ));
  }

  void _onSubmit(
    HealthDrawerSubmit event,
    Emitter<HealthDrawerState> emit,
  ) {
    emit(state.copyWith(status: HealthDrawerStatus.loading));

    try {
      state.filter.toMap();

      emit(state.copyWith(status: HealthDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: HealthDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
