import 'package:e_member_app/feature/drawer/social_details/domain/entity/social_entity.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_event.dart';
import 'package:e_member_app/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialDrawerBloc extends Bloc<SocialDrawerEvent, SocialDrawerState> {
  SocialDrawerBloc() : super(const SocialDrawerState()) {
    on<SocialDrawerStepChanged>(_onStepChanged);
    on<SocialDrawerOptionSelected>(_onOptionSelected);
    on<SocialDrawerNextStep>(_onNextStep);
    on<SocialDrawerPreviousStep>(_onPreviousStep);
    on<SocialDrawerReset>(_onReset);
    on<SocialDrawerSubmit>(_onSubmit);
  }

  void _onStepChanged(
    SocialDrawerStepChanged event,
    Emitter<SocialDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < 5) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    SocialDrawerOptionSelected event,
    Emitter<SocialDrawerState> emit,
  ) {
    SocialDrawerFilter updatedFilter;
    
    switch (event.filterKey) {
      case 'റേഷൻ കാർഡിൽ ഉൾപ്പെടുത്തിയിട്ടുണ്ടോ':
        updatedFilter = state.filter.copyWith(includedInRationCard: event.option);
        break;
      case 'പെൻഷൻ ലഭിക്കുന്നുണ്ടോ':
        updatedFilter = state.filter.copyWith(receivingPension: event.option);
        break;
      case 'പെൻഷൻ തരം':
        updatedFilter = state.filter.copyWith(pensionType: event.option);
        break;
      case 'പെൻഷൻ ആവശ്യമുണ്ടോ':
        updatedFilter = state.filter.copyWith(needPension: event.option);
        break;
      case 'നിങ്ങൾ ദാരിദ്ര്യ നിർമ്മാർജ്ജന പദ്ധതികളിൽ അംഗമാണോ':
        updatedFilter = state.filter.copyWith(povertyAlleviationMember: event.option);
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
    emit(const SocialDrawerState());
  }

  void _onSubmit(
    SocialDrawerSubmit event,
    Emitter<SocialDrawerState> emit,
  ) {
    emit(state.copyWith(status: SocialDrawerStatus.loading));
    
    try {
      // Here you can add your submission logic
      // For example, save to repository, send to API, etc.
      print('Social Drawer Filter: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: SocialDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: SocialDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}