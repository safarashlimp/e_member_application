class PersonalDetailsModel {
  final String? id;
  final String? householdId;
  final String name;
  final String mobile;
  final String whatsapp;
  final String bloodgroup;
  final String relationId;
  final String genderId;
  final String dob;
  final String maritalStatusId;
  final String religionId;
  final String casteId;
  final String surveyor;
  final String? wardMember;

  PersonalDetailsModel({
    this.id,
    this.householdId,
    required this.name,
    required this.mobile,
    required this.whatsapp,
    required this.bloodgroup,
    required this.relationId,
    required this.genderId,
    required this.dob,
    required this.maritalStatusId,
    required this.religionId,
    required this.casteId,
    required this.surveyor,
    this.wardMember,
  });
}
