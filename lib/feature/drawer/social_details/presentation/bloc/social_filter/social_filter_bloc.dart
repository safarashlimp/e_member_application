// lib/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_bloc.dart

import 'package:e_member_app/feature/drawer/social_details/domain/entity/social_entity.dart';
import 'package:e_member_app/feature/drawer/social_details/domain/repo/socila_drawer_repo.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_event.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialDrawerBloc extends Bloc<SocialDrawerEvent, SocialDrawerState> {
  final SocialDrawerRepository _repository;

  SocialDrawerBloc(this._repository) : super(const SocialDrawerState()) {
    on<SocialDrawerInitialize>(_onInitialize);
    on<SocialDrawerStepChanged>(_onStepChanged);
    on<SocialDrawerOptionSelected>(_onOptionSelected);
    on<SocialDrawerNextStep>(_onNextStep);
    on<SocialDrawerPreviousStep>(_onPreviousStep);
    on<SocialDrawerReset>(_onReset);
    on<SocialDrawerSubmit>(_onSubmit);
  }

  Future<void> _onInitialize(
    SocialDrawerInitialize event,
    Emitter<SocialDrawerState> emit,
  ) async {
    emit(state.copyWith(status: SocialDrawerStatus.loading));

    try {
      final steps = await _repository.getAllSocialSteps();
      emit(state.copyWith(
        status: SocialDrawerStatus.loaded,
        steps: steps,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SocialDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onStepChanged(
    SocialDrawerStepChanged event,
    Emitter<SocialDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < state.steps.length) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    SocialDrawerOptionSelected event,
    Emitter<SocialDrawerState> emit,
  ) {
    SocialDrawerFilter updatedFilter;

    switch (event.stepIndex) {
      case 0: // റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ
        updatedFilter =
            state.filter.copyWith(includedInRationCard: event.optionId);
        break;
      case 1: // പെൻഷൻ ലഭിക്കുന്നുണ്ടോ
        updatedFilter = state.filter.copyWith(receivingPension: event.optionId);
        break;
      case 2: // പെൻഷൻ തരം
        updatedFilter = state.filter.copyWith(pensionType: event.optionId);
        break;
      case 3: // പെൻഷൻ ആവശ്യമുണ്ടോ
        updatedFilter = state.filter.copyWith(needPension: event.optionId);
        break;
      case 4: // ദാരിദ്ര്യ നിർമ്മാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ
        updatedFilter =
            state.filter.copyWith(povertyAlleviationMember: event.optionId);
        break;
      default:
        return;
    }

    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    SocialDrawerNextStep event,
    Emitter<SocialDrawerState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    SocialDrawerPreviousStep event,
    Emitter<SocialDrawerState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    SocialDrawerReset event,
    Emitter<SocialDrawerState> emit,
  ) {
    emit(state.copyWith(
      filter: const SocialDrawerFilter(),
      currentStep: 0,
    ));
  }

  void _onSubmit(
    SocialDrawerSubmit event,
    Emitter<SocialDrawerState> emit,
  ) {
    emit(state.copyWith(status: SocialDrawerStatus.loading));

    try {
      state.filter.toMap();

      emit(state.copyWith(status: SocialDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: SocialDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
