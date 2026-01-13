
  import 'package:freezed_annotation/freezed_annotation.dart';

  part 'add_family_member_params.freezed.dart';
  part 'add_family_member_params.g.dart';

  @freezed
  class AddFamilyMemberViewModel with _$AddFamilyMemberViewModel {
    const factory AddFamilyMemberViewModel({
      // Personal
      String? name,
      String? mobile,
      @JsonKey(name: 'bloodgroup') int? bloodgroup, // instead of String?
@JsonKey(name: 'caste_id') int? casteId,
@JsonKey(name: 'marital_status_id') int? maritalStatusId,
      @JsonKey(name: 'WhatsApp') String? whatsapp,
    
      @JsonKey(name: 'relation_id') String? relationId,
      @JsonKey(name: 'gender_id') String? genderId,
      String? dob,
    
      @JsonKey(name: 'religion_id') String? religionId,
    
      // Survey
      String? surveyor,

      // Education
      @JsonKey(name: 'qualification_id') String? qualificationId,
      @JsonKey(name: 'currently_studying') int? currentlyStudying,
   
      @JsonKey(name: 'course_other') String? courseOther,
      String? institution,
      @JsonKey(name: 'need_education_support') int? needEducationSupport,

      // Employment
      @JsonKey(name: 'employment_status_id') String? employmentStatusId,
      @JsonKey(name: 'occupation_id') String? occupationId,
      String? skills, // JSON string of skill IDs
      @JsonKey(name: 'skill_details') String? skillDetails,
      @JsonKey(name: 'need_job_support_id') String? needJobSupportId,
      @JsonKey(name: 'norka_registered') int? norkaRegistered,
      @JsonKey(name: 'agriculure_type') int ? agricultureType,

      // Health
      @JsonKey(name: 'is_patient') int? isPatient,

      @JsonKey(name: 'treatment_place') String? treatmentPlace,
      int? disabled,
      @JsonKey(name: 'disability_benefit') int? disabilityBenefit,
      @JsonKey(name: 'insurance_card') int? insuranceCard,
      @JsonKey(name: 'insurance_type_id') int ? insuranceTypeId,
      @JsonKey(name: 'health_help') String? healthHelp,
    @JsonKey(name: 'course_id') int? courseId,
@JsonKey(name: 'diseases') int? diseases,
@JsonKey(name: 'pension_type_id') int? pensionTypeId,

      // Welfare
      @JsonKey(name: 'included_in_ration') int? includedInRation,
      @JsonKey(name: 'receiving_pension') int? receivingPension,


      @JsonKey(name: 'need_pension_type_id') String? needPensionTypeId,
      @JsonKey(name: 'poverty_pgm') int? povertyPgm,
    }) = _AddFamilyMemberViewModel;

    factory AddFamilyMemberViewModel.fromJson(Map<String, dynamic> json) =>
        _$AddFamilyMemberViewModelFromJson(json);
  }