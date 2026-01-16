abstract class EditFamilyMemberState {}

class EditFamilyMemberInitial extends EditFamilyMemberState {}

// ✅ Form loaded with data
class EditFamilyMemberFormLoaded extends EditFamilyMemberState {
  final String name;
  final String mobile;
  final String whatsapp;
  final String dob;
  final String surveyor;
  final String? bloodGroupId;
  final String? bloodGroupName;
  final String? relationId;
  final String? relationName;
  final String? genderId;
  final String? genderName;
  final String? maritalStatusId;
  final String? maritalStatusName;
  final String? religionId;
  final String? religionName;
  final String? casteId;
  final String? casteName;

  EditFamilyMemberFormLoaded({
    required this.name,
    required this.mobile,
    required this.whatsapp,
    required this.dob,
    required this.surveyor,
    this.bloodGroupId,
    this.bloodGroupName,
    this.relationId,
    this.relationName,
    this.genderId,
    this.genderName,
    this.maritalStatusId,
    this.maritalStatusName,
    this.religionId,
    this.religionName,
    this.casteId,
    this.casteName,
  });

  // ✅ Copy with method for immutability
  EditFamilyMemberFormLoaded copyWith({
    String? name,
    String? mobile,
    String? whatsapp,
    String? dob,
    String? surveyor,
    String? bloodGroupId,
    String? bloodGroupName,
    String? relationId,
    String? relationName,
    String? genderId,
    String? genderName,
    String? maritalStatusId,
    String? maritalStatusName,
    String? religionId,
    String? religionName,
    String? casteId,
    String? casteName,
  }) {
    return EditFamilyMemberFormLoaded(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      whatsapp: whatsapp ?? this.whatsapp,
      dob: dob ?? this.dob,
      surveyor: surveyor ?? this.surveyor,
      bloodGroupId: bloodGroupId ?? this.bloodGroupId,
      bloodGroupName: bloodGroupName ?? this.bloodGroupName,
      relationId: relationId ?? this.relationId,
      relationName: relationName ?? this.relationName,
      genderId: genderId ?? this.genderId,
      genderName: genderName ?? this.genderName,
      maritalStatusId: maritalStatusId ?? this.maritalStatusId,
      maritalStatusName: maritalStatusName ?? this.maritalStatusName,
      religionId: religionId ?? this.religionId,
      religionName: religionName ?? this.religionName,
      casteId: casteId ?? this.casteId,
      casteName: casteName ?? this.casteName,
    );
  }
}

class EditFamilyMemberSubmitting extends EditFamilyMemberState {
  final String screenName;

  EditFamilyMemberSubmitting(this.screenName);
}

class EditFamilyMemberSubmitSuccess extends EditFamilyMemberState {
  final String screenName;
  final String responseId;

  EditFamilyMemberSubmitSuccess({
    required this.screenName,
    required this.responseId,
  });
}

class EditFamilyMemberSubmitFailure extends EditFamilyMemberState {
  final String screenName;
  final String message;

  EditFamilyMemberSubmitFailure({
    required this.screenName,
    required this.message,
  });
}
