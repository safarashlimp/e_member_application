// class PersonalDetailsResponse {
//   final bool status;
//   final List<PersonalDetailsModel> data;

//   PersonalDetailsResponse({required this.status, required this.data});

//   factory PersonalDetailsResponse.fromJson(Map<String, dynamic> json) {
//     return PersonalDetailsResponse(
//       status: json['Status'],
//       data: List.from(json['data'])
//           .map((e) => PersonalDetailsModel.fromJson(e))
//           .toList(),
//     );
//   }
// }

class PersonalDetailsModel {
  final String ?id;
  final String ?householdId;
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
   final String ?wardMember;

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

  // factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
  //   return PersonalDetailsModel(
  //     id: json['id'],
  //     householdId: json['household_id'],
  //     name: json['name'],
  //     mobile: json['mobile'],
  //     whatsapp: json['whatsapp'],
  //     bloodgroup: json['bloodgroup'],
  //     relationId: json['relation_id'],
  //     genderId: json['gender_id'],
  //     dob: json['dob'],
  //     maritalStatusId: json['marital_status_id'],
  //     religionId: json['religion_id'],
  //     casteId: json['caste_id'],
  //     surveyor: json['surveyor'],
  //     wardMember: json['ward_member'],
  //   );
  // }
}
