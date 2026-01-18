import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_event.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsDrawerBloc extends Bloc<JobDetailsDrawerEvent, JobDetailsDrawerState> {
  JobDetailsDrawerBloc() : super(const JobDetailsDrawerState()) {
    on<JobDetailsDrawerStepChanged>(_onStepChanged);
    on<JobDetailsDrawerOptionSelected>(_onOptionSelected);
    on<JobDetailsDrawerNextStep>(_onNextStep);
    on<JobDetailsDrawerPreviousStep>(_onPreviousStep);
    on<JobDetailsDrawerReset>(_onReset);
    on<JobDetailsDrawerSubmit>(_onSubmit);
  }

  void _onStepChanged(
    JobDetailsDrawerStepChanged event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < 3) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    JobDetailsDrawerOptionSelected event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    JobDetailsFilter updatedFilter;
    
    switch (event.filterKey) {
      case 'തൊഴിൽ നില':
        updatedFilter = state.filter.copyWith(employmentStatus: event.option);
        break;
      case 'തൊഴിൽ':
        updatedFilter = state.filter.copyWith(occupation: event.option);
        break;
      case 'തൊഴിൽ മേഖലയിൽ സഹായം ആവശ്യമുണ്ടോ':
        updatedFilter = state.filter.copyWith(needEmploymentHelp: event.option);
        break;
      default:
        return;
    }
    
    emit(state.copyWith(filter: updatedFilter));
  }

  void _onNextStep(
    JobDetailsDrawerNextStep event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    if (state.canGoNext && state.getCurrentSelection() != null) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void _onPreviousStep(
    JobDetailsDrawerPreviousStep event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    if (state.canGoPrevious) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onReset(
    JobDetailsDrawerReset event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    emit(const JobDetailsDrawerState());
  }

  void _onSubmit(
    JobDetailsDrawerSubmit event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    emit(state.copyWith(status: JobDetailsDrawerStatus.loading));
    
    try {
      // Here you can add your submission logic
      // For example, save to repository, send to API, etc.
      print('Job Details Filter: ${state.filter.toMap()}');
      
      emit(state.copyWith(status: JobDetailsDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: JobDetailsDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}