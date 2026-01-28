// lib/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_bloc.dart

import 'package:e_member_app/feature/drawer/job_details/domain/entity/job_details_filter.dart';
import 'package:e_member_app/feature/drawer/job_details/domain/repo/job_repo_model.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_event.dart';
import 'package:e_member_app/feature/drawer/job_details/presentation/bloc/job_details/jobdetails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsDrawerBloc extends Bloc<JobDetailsDrawerEvent, JobDetailsDrawerState> {
  final JobDrawerRepository _repository;

  JobDetailsDrawerBloc(this._repository) : super(const JobDetailsDrawerState()) {
    on<JobDetailsDrawerInitialize>(_onInitialize);
    on<JobDetailsDrawerStepChanged>(_onStepChanged);
    on<JobDetailsDrawerOptionSelected>(_onOptionSelected);
    on<JobDetailsDrawerNextStep>(_onNextStep);
    on<JobDetailsDrawerPreviousStep>(_onPreviousStep);
    on<JobDetailsDrawerReset>(_onReset);
    on<JobDetailsDrawerSubmit>(_onSubmit);
  }

  Future<void> _onInitialize(
    JobDetailsDrawerInitialize event,
    Emitter<JobDetailsDrawerState> emit,
  ) async {
    emit(state.copyWith(status: JobDetailsDrawerStatus.loading));
    
    try {
      final steps = await _repository.getAllJobSteps();
      emit(state.copyWith(
        status: JobDetailsDrawerStatus.loaded,
        steps: steps,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: JobDetailsDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onStepChanged(
    JobDetailsDrawerStepChanged event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    if (event.step >= 0 && event.step < state.steps.length) {
      emit(state.copyWith(currentStep: event.step));
    }
  }

  void _onOptionSelected(
    JobDetailsDrawerOptionSelected event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    JobDetailsFilter updatedFilter;
    
    switch (event.stepIndex) {
      case 0: // തൊഴിൽ നില
        updatedFilter = state.filter.copyWith(employmentStatus: event.optionId);
        break;
      case 1: // തൊഴിൽ
        updatedFilter = state.filter.copyWith(occupation: event.optionId);
        break;
      case 2: // തൊഴിൽ മേഖലയിൽ സഹായം
        updatedFilter = state.filter.copyWith(needEmploymentHelp: event.optionId);
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
    if (state.canGoNext) {
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
    emit(state.copyWith(
      filter: const JobDetailsFilter(),
      currentStep: 0,
    ));
  }

  void _onSubmit(
    JobDetailsDrawerSubmit event,
    Emitter<JobDetailsDrawerState> emit,
  ) {
    emit(state.copyWith(status: JobDetailsDrawerStatus.loading));
    
    try {
      final filterMap = state.filter.toMap();
      print('Job Details Filter Submitted: $filterMap');
      // Example output:
      // {
      //   'employment_status_id': '3',
      //   'occupation_id': '15',
      //   'employment_support_id': '2'
      // }
      
      emit(state.copyWith(status: JobDetailsDrawerStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: JobDetailsDrawerStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}