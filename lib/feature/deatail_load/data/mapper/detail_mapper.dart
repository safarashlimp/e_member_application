import 'package:e_member_app/feature/deatail_load/domain/models/screen_five_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_forth_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_one_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_second_model.dart';
import 'package:e_member_app/feature/deatail_load/domain/models/screen_third_model.dart';

class DetailMapper {
  static PersonalDetailsModel fromApiToScreen1(Map<String, dynamic> json) {
    final List list = json['data'];
    if (list.isEmpty) {
      throw Exception('Header data empty');
    }

    final Map<String, dynamic> data = list.first;
    return PersonalDetailsModel(
      id: data['id'] ?? '',
      householdId: data['household_id'] ?? '',
      name: data['name'] ?? '',
      mobile: data['mobile'] ?? '',
      whatsapp: data['whatsapp'] ?? '',
      bloodgroup: data['bloodgroup']?.toString() ?? '',
      relationId: data['relation_id']?.toString() ?? '',
      genderId: data['gender_id']?.toString() ?? '',
      dob: data['dob'] ?? '',
      maritalStatusId: data['marital_status_id']?.toString() ?? '',
      religionId: data['religion_id'] ?? '',
      casteId: data['caste_id'] ?? '',
      surveyor: data['surveyor'] ?? '',
      wardMember: data['ward_member'] ?? '',
    );
  }

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
