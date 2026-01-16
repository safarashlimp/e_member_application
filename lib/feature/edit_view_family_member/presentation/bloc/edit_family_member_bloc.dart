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

  EditFamilyMemberBloc(employmentDetailsRepository, {
    required this.familyMemberRepository,
    required this.educationRepository,
    required this.employmentRepository,
    required this.healthRepository,
    required this.pensionRepository,
  }) : super(EditFamilyMemberInitial()) {
    // ✅ Form field update handlers
    on<InitializeFormEvent>(_onInitializeForm);
    on<UpdateNameEvent>(_onUpdateName);
    on<UpdateMobileEvent>(_onUpdateMobile);
    on<UpdateWhatsappEvent>(_onUpdateWhatsapp);
    on<UpdateDobEvent>(_onUpdateDob);
    on<UpdateSurveyorEvent>(_onUpdateSurveyor);
    on<UpdateBloodGroupEvent>(_onUpdateBloodGroup);
    on<UpdateRelationEvent>(_onUpdateRelation);
    on<UpdateGenderEvent>(_onUpdateGender);
    on<UpdateMaritalStatusEvent>(_onUpdateMaritalStatus);
    on<UpdateReligionEvent>(_onUpdateReligion);
    on<UpdateCasteEvent>(_onUpdateCaste);
    
    // ✅ Submit handlers
    on<SubmitPersonalDetailsEvent>(_onSubmitPersonalDetails);
    on<SubmitEducationDetailsEvent>(_onSubmitEducationDetails);
    on<SubmitEmploymentDetailsEvent>(_onSubmitEmploymentDetails);
    on<SubmitHealthDetailsEvent>(_onSubmitHealthDetails);
    on<SubmitPensionDetailsEvent>(_onSubmitPensionDetails);
  }

  // ✅ Initialize form with existing data
  Future<void> _onInitializeForm(
    InitializeFormEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberFormLoaded(
      name: event.data.name ?? '',
      mobile: event.data.mobile,
      whatsapp: event.data.whatsapp,
      dob: event.data.dob,
      surveyor: event.data.surveyor,
      bloodGroupId: event.data.bloodgroup,
      relationId: event.data.relationId,
      genderId: event.data.genderId,
      maritalStatusId: event.data.maritalStatusId,
      religionId: event.data.religionId,
      casteId: event.data.casteId,
    ));
  }

  // ✅ Update individual fields
  Future<void> _onUpdateName(
    UpdateNameEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(name: event.name));
    }
  }

  Future<void> _onUpdateMobile(
    UpdateMobileEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      // Auto-sync whatsapp with mobile
      final currentState = (state as EditFamilyMemberFormLoaded);
      emit(currentState.copyWith(
        mobile: event.mobile,
        whatsapp: event.mobile, // Auto-copy mobile to whatsapp
      ));
    }
  }

  Future<void> _onUpdateWhatsapp(
    UpdateWhatsappEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded)
          .copyWith(whatsapp: event.whatsapp));
    }
  }

  Future<void> _onUpdateDob(
    UpdateDobEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(dob: event.dob));
    }
  }

  Future<void> _onUpdateSurveyor(
    UpdateSurveyorEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded)
          .copyWith(surveyor: event.surveyor));
    }
  }

  Future<void> _onUpdateBloodGroup(
    UpdateBloodGroupEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(
        bloodGroupId: event.bloodGroupId,
        bloodGroupName: event.bloodGroupName,
      ));
    }
  }

  Future<void> _onUpdateRelation(
    UpdateRelationEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(
        relationId: event.relationId,
        relationName: event.relationName,
      ));
    }
  }

  Future<void> _onUpdateGender(
    UpdateGenderEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(
        genderId: event.genderId,
        genderName: event.genderName,
      ));
    }
  }

  Future<void> _onUpdateMaritalStatus(
    UpdateMaritalStatusEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(
        maritalStatusId: event.statusId,
        maritalStatusName: event.statusName,
      ));
    }
  }

  Future<void> _onUpdateReligion(
    UpdateReligionEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(
        religionId: event.religionId,
        religionName: event.religionName,
      ));
    }
  }

  Future<void> _onUpdateCaste(
    UpdateCasteEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    if (state is EditFamilyMemberFormLoaded) {
      emit((state as EditFamilyMemberFormLoaded).copyWith(
        casteId: event.casteId,
        casteName: event.casteName,
      ));
    }
  }

  // Screen 1 - Personal Details
  Future<void> _onSubmitPersonalDetails(
    SubmitPersonalDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Personal Details'));

    try {
      await familyMemberRepository.submitFamilyMember(
        clientId: event.clientId,
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Personal Details',
        responseId: event.editId?.toString() ?? 'new',
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Personal Details',
        message: e.toString(),
      ));
    }
  }

  // Screen 2 - Education Details
  Future<void> _onSubmitEducationDetails(
    SubmitEducationDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Education Details'));

    try {
      await educationRepository.submitEducationDetails(
        clientId: event.clientId,
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Education Details',
        responseId: event.editId?.toString() ?? 'new',
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Education Details',
        message: e.toString(),
      ));
    }
  }

  // Screen 3 - Employment Details
  Future<void> _onSubmitEmploymentDetails(
    SubmitEmploymentDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Employment Details'));

    try {
      await employmentRepository.submitEmploymentDetails(
        clientId: event.clientId,
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Employment Details',
        responseId: event.editId?.toString() ?? 'new',
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Employment Details',
        message: e.toString(),
      ));
    }
  }

  // Screen 4 - Health Details
  Future<void> _onSubmitHealthDetails(
    SubmitHealthDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Health Details'));

    try {
      await healthRepository.submitHealthDetails(
        clientId: event.clientId,
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Health Details',
        responseId: event.editId?.toString() ?? 'new',
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Health Details',
        message: e.toString(),
      ));
    }
  }

  // Screen 5 - Pension/Welfare Details
  Future<void> _onSubmitPensionDetails(
    SubmitPensionDetailsEvent event,
    Emitter<EditFamilyMemberState> emit,
  ) async {
    emit(EditFamilyMemberSubmitting('Pension Details'));

    try {
      await pensionRepository.submitPensionDetails(
        clientId: event.clientId,
        editId: event.editId,
        data: event.data,
      );

      emit(EditFamilyMemberSubmitSuccess(
        screenName: 'Pension Details',
        responseId: event.editId?.toString() ?? 'new',
      ));
    } catch (e) {
      emit(EditFamilyMemberSubmitFailure(
        screenName: 'Pension Details',
        message: e.toString(),
      ));
    }
  }
}
