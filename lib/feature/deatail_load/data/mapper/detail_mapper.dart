import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';


class DetailMapper {

  // 🔹 Safe int parser
  // static int parseIntSafe(dynamic value) {
  //   if (value == null) return 0;
  //   if (value is int) return value;
  //   final str = value.toString();
  //   if (str.isEmpty || str == 'null') return 0;
  //   return int.tryParse(str) ?? 0;
  // }

  // 1️⃣ SCREEN 1 → PersonalDetailsModel
  static PersonalDetailsModel fromApiToScreen1(Map<String, dynamic> json) {
     int parseIntSafe(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    final str = value.toString();
    if (str.isEmpty || str == 'null') return 0;
    return int.tryParse(str) ?? 0;
  }
   
    final List list = json['data'];
    if (list.isEmpty) {
      throw Exception('Header data empty');
    }

     final Map<String, dynamic> data = list.first;
        return PersonalDetailsModel(
              id: data['id'] ?? '',
              householdId: data['household_id'] ?? '',
              name: data['name'] ?? '',
              mobile:data['mobile'] ?? '',
              whatsapp: data['whatsapp'] ?? '',
              bloodgroup: data['bloodgroup'] ?? '',
              relationId:data['relation_id'] ?? '',
              genderId: data['gender_id'] ?? '',
              dob:data['dob'] ?? '',
              maritalStatusId: data['marital_status_id'] ?? '',
              religionId: data['religion_id'] ?? '',
              casteId: data['caste_id'] ?? '',
              surveyor:data['surveyor'] ?? '',
              wardMember: data['ward_member'] ?? '',
            );
       

  }

  // 2️⃣ SCREEN 2 → EducationModel
  static EducationResponse fromApiToScreen2(Map<String, dynamic> json) {
     if (json['data'] == null || (json['data'] as List).isEmpty) {
      throw Exception('Screen2 data empty');
    }

  final List<EducationModel> dataList = (json['data'] as List)
        .map((item) => EducationModel.fromJson(item))
        .toList();

    return EducationResponse(
      status: json['Status'] ?? false,
      data: dataList,
    );
  }

  // 3️⃣ SCREEN 3 → EmploymentModel
  static EmploymentResponse fromApiToScreen3(Map<String, dynamic> json) {
    if (json['data'] == null || (json['data'] as List).isEmpty) {
      throw Exception('Screen3 data empty');
    }


final List<EmploymentModel> dataList = (json['data'] as List)
        .map((item) => EmploymentModel.fromJson(item))
        .toList();
    return EmploymentResponse(
      status: json['Status'] ?? false,
      data: dataList,
    );
  }

  // 4️⃣ SCREEN 4 → HealthModel
  static HealthResponse fromApiToScreen4(Map<String, dynamic> json) {
    if (json['data'] == null || (json['data'] as List).isEmpty) {
      throw Exception('Screen4 data empty');
    }

  final List<HealthModel> dataList = (json['data'] as List)
        .map((item) => HealthModel.fromJson(item))
        .toList();

    return HealthResponse(
      status: json['Status'] ?? false,
      data: dataList,
    );
  }

  // 5️⃣ SCREEN 5 → WelfareModel
  static WelfareResponse fromApiToScreen5(Map<String, dynamic> json) {
    if (json['data'] == null || (json['data'] as List).isEmpty) {
      throw Exception('Screen5 data empty');
    }

 final List<WelfareModel> dataList = (json['data'] as List)
        .map((item) => WelfareModel.fromJson(item))
        .toList();

    return WelfareResponse(
      status: json['Status'] ?? false,
      data: dataList,
    );
  }
}
