import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_firstpage_details_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_details_secondpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_3rdpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_4thpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/data/repository/edit_family_member_detail_5thpage_repository.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_event.dart';
import 'package:e_member_app/feature/edit_view_family_member/presentation/bloc/edit_family_member_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFamilyMemberBloc
    extends Bloc<EditFamilyMemberEvent, EditFamilyMemberState> {
  final FamilyMemberRepository familyMemberRepository;
  final EducationDetailsRepository educationRepository;
  final EmploymentDetailsRepository employmentRepository;
  final HealthDetailsRepository healthRepository;
  final PensionDetailsRepository pensionRepository;

  EditFamilyMemberBloc(
    employmentDetailsRepository, {
    required this.familyMemberRepository,
    required this.educationRepository,
    required this.employmentRepository,
    required this.healthRepository,
    required this.pensionRepository,
  }) : super(EditFamilyMemberInitial()) {
    on<SubmitPersonalDetailsEvent>(_onSubmitPersonalDetails);
    on<SubmitEducationDetailsEvent>(_onSubmitEducationDetails);
    on<SubmitEmploymentDetailsEvent>(_onSubmitEmploymentDetails);
    on<SubmitHealthDetailsEvent>(_onSubmitHealthDetails);
    on<SubmitPensionDetailsEvent>(_onSubmitPensionDetails);
  }

  Future<void> _onSubmitPersonalDetails(
    SubmitPersonalDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Personal Details'));

    try {
      await familyMemberRepository.submitFamilyMember(
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Personal Details',
        responseId: event.editId,
        updatedData: event.data,
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Personal Details',
        message: e.toString(),
      ));
    }
  }

  Future<void> _onSubmitEducationDetails(
    SubmitEducationDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Education Details'));

    try {
      await educationRepository.submitEducationDetails(
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Education Details',
        responseId: event.editId,
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Education Details',
        message: e.toString(),
      ));
    }
  }

  Future<void> _onSubmitEmploymentDetails(
    SubmitEmploymentDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Employment Details'));

    try {
      await employmentRepository.submitEmploymentDetails(
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Employment Details',
        responseId: event.editId,
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Employment Details',
        message: e.toString(),
      ));
    }
  }

  Future<void> _onSubmitHealthDetails(
    SubmitHealthDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Health Details'));

    try {
      await healthRepository.submitHealthDetails(
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Health Details',
        responseId: event.editId,
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Health Details',
        message: e.toString(),
      ));
    }
  }

  Future<void> _onSubmitPensionDetails(
    SubmitPensionDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Pension Details'));

    try {
      await pensionRepository.submitPensionDetails(
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Pension Details',
        responseId: event.editId,
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Pension Details',
        message: e.toString(),
      ));
    }
  }
}
