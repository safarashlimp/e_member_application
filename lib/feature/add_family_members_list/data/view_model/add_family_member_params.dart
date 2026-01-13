  import 'dart:convert';


  class AddFamilyMemberViewModel {

    final String ? editId;
    final int ?clientId;
    final int ?userId;
    final String? name;
    final String? mobile;
    final String? bloodgroup;
    final String? casteId;
    final String? maritalStatusId;
    final String? relationId;
    final String? genderId;
    final String? dob;
    final String? religionId;
    final String? whatsapp;
    final String? surveyor;
    final String? qualificationId;
    final int? currentlyStudying;
    final String? courseOther;
    final String? institution;
    final int? needEducationSupport;
    final String? courseId;
    final String? employmentStatusId;
    final String? occupationId;
    final String? skills;
    final String? skillDetails;
    final String? needJobSupportId;
    final int? norkaRegistered;
    final String? agricultureType;
    final int? isPatient;
    final String? treatmentPlace;
    final int? disabled;
    final int? disabilityBenefit;
    final int? insuranceCard;
    final int? insuranceTypeId;
    final String? healthHelp;
    final String? diseases;
    final String? pensionTypeId;
    final int? includedInRation;
    final int? receivingPension;
    final String? needPensionTypeId;
    final String? povertyPgm;

    AddFamilyMemberViewModel ({
      this.editId,
      this.clientId,
    this.userId,
      this.name,
      this.mobile,
      this.bloodgroup,
      this.casteId,
      this.maritalStatusId,
      this.relationId,
      this.genderId,
      this.dob,
      this.religionId,
      this.whatsapp,
      this.surveyor,
      this.qualificationId,
      this.currentlyStudying,
      this.courseOther,
      this.institution,
      this.needEducationSupport,
      this.courseId,
      this.employmentStatusId,
      this.occupationId,
      this.skills,
      this.skillDetails,
      this.needJobSupportId,
      this.norkaRegistered,
      this.agricultureType,
      this.isPatient,
      this.treatmentPlace,
      this.disabled,
      this.disabilityBenefit,
      this.insuranceCard,
      this.insuranceTypeId,
      this.healthHelp,
      this.diseases,
      this.pensionTypeId,
      this.includedInRation,
      this.receivingPension,
      this.needPensionTypeId,
      this.povertyPgm,
    });
  /// Helper to convert String? to int safely
  //int _toInt(String? value) => int.tryParse(value ?? '0') ?? 0;

  /// copyWith for Bloc
  AddFamilyMemberViewModel copyWith({
    int? clientId,
    int? userId,
  }) {
    return AddFamilyMemberViewModel(
      clientId: clientId ?? this.clientId,
      userId: userId ?? this.userId,
      editId: editId,
      name: name,
      mobile: mobile,
      bloodgroup: bloodgroup,
      casteId: casteId,
      maritalStatusId: maritalStatusId,
      relationId: relationId,
      genderId: genderId,
      religionId: religionId,
      dob: dob,
      whatsapp: whatsapp,
      surveyor: surveyor,
      qualificationId: qualificationId,
      currentlyStudying: currentlyStudying,
      courseOther: courseOther,
      institution: institution,
      needEducationSupport: needEducationSupport,
      courseId: courseId,
      employmentStatusId: employmentStatusId,
      occupationId: occupationId,
      skills: skills,
      skillDetails: skillDetails,
      needJobSupportId: needJobSupportId,
      norkaRegistered: norkaRegistered,
      agricultureType: agricultureType,
      isPatient: isPatient,
      treatmentPlace: treatmentPlace,
      disabled: disabled,
      disabilityBenefit: disabilityBenefit,
      insuranceCard: insuranceCard,
      insuranceTypeId: insuranceTypeId,
      healthHelp: healthHelp,
      diseases: diseases,
      pensionTypeId: pensionTypeId,
      includedInRation: includedInRation,
      receivingPension: receivingPension,
      needPensionTypeId: needPensionTypeId,
      povertyPgm: povertyPgm,
    );
  }


      Map<String, dynamic> toJson() {
  return {
    'clientid': clientId ?? 0,
    'household_id': editId ?? '',
    'ward_member': userId ?? 0,
    'name': name ?? '',
    'mobile': mobile ?? '',
    'bloodgroup': bloodgroup ?? '',
    'caste_id': int.tryParse(casteId ?? '0') ?? 0,
    'marital_status_id': int.tryParse(maritalStatusId ?? '0') ?? 0,
    'relation_id': int.tryParse(relationId ?? '0') ?? 0,
    'gender_id': int.tryParse(genderId ?? '0') ?? 0,
    'dob': dob ?? '',
    'religion_id': int.tryParse(religionId ?? '0') ?? 0,
    'whatsapp': whatsapp ?? '',
    'surveyor': surveyor ?? '',
    'qualification_id': int.tryParse(qualificationId ?? '0') ?? 0,
    'currently_studying': currentlyStudying ?? 0,
    'course_other': courseOther ?? '',
    'institution': institution ?? '',
    'need_education_support': needEducationSupport ?? 0,
    'course_id': int.tryParse(courseId ?? '0') ?? 0,
    'employment_status_id': int.tryParse(employmentStatusId ?? '0') ?? 0,
    'occupation_id': int.tryParse(occupationId ?? '0') ?? 0,
    'skills': skills != null ? jsonDecode(skills!) : [],
    'skill_details': skillDetails ?? '',
    'need_job_support_id': int.tryParse(needJobSupportId ?? '0') ?? 0,
    'norka_registered': norkaRegistered ?? 0,
    'agriculture_type': agricultureType ?? '',
    'is_patient': isPatient ?? 0,
    'treatment_place': treatmentPlace ?? '',
    'disabled': disabled ?? 0,
    'disability_benefit': disabilityBenefit ?? 0,
    'insurance_card': insuranceCard ?? 0,
    'insurance_type_id': insuranceTypeId ?? 0,
    'health_help': healthHelp ?? '',
    'diseases': diseases ?? '',
    'pension_type_id': pensionTypeId ?? 0,
    'included_in_ration': includedInRation ?? 0,
    'receiving_pension': receivingPension ?? 0,
    'need_pension_type_id': needPensionTypeId ?? 0,
    'poverty_pgm': povertyPgm ?? '',
  };
}

    }
  
