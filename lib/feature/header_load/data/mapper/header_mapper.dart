import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';
import 'package:e_member_app/feature/header_load/domain/scareen2model.dart';
import 'package:e_member_app/feature/login/data/model/usermodel.dart' hide Datum;

class HeaderMapper {

  // 1️⃣ Parse Screen1 JSON → SurveyHeaderModel
  static SurveyHeaderModel fromApiToScreen1(Map<String, dynamic> json) {
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

    return SurveyHeaderModel(
      houseChief: data['house_chief'] ?? '',
      houseNumber: data['house_number'] ?? '',
      houseName: data['house_name'] ?? '',
      rationCardNumber: data['ration_card_number'] ?? '',
      rationCardTypeId: data['ration_card_type_id']?.toString() ?? '',
      annualIncome: data['annual_income']?.toString() ?? '',
      hasJobCard: parseIntSafe(data['has_job_card']),
      kudumbashreeMember: parseIntSafe(data['kudumbashree_member']),
      govtBeneficiary: parseIntSafe(data['govt_beneficiary']),
      extremePoor: parseIntSafe(data['extreme_poor']),
    );
  }

  // 2️⃣ Parse Screen2 JSON → Screen2Model
  static Screen2Model fromApiToScreen2(Map<String, dynamic> json) {
    if (json['data'] == null || (json['data'] as List).isEmpty) {
      throw Exception('Screen2 data empty');
    }

    final List<Datum> dataList = (json['data'] as List)
        .map((item) => Datum.fromJson(item))
        .toList();

    return Screen2Model(
      status: json['Status'] ?? false,
      data: dataList,
    );
  }
}
