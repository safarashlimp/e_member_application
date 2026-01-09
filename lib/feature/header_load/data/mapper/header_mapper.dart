import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';

class HeaderMapper {

 


  static SurveyHeaderModel fromApi(Map<String, dynamic> json) {


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
      kudumbashreeMember:
           parseIntSafe(data['kudumbashree_member']),
      govtBeneficiary:
           parseIntSafe(data['govt_beneficiary']),
      extremePoor: parseIntSafe(data['extreme_poor']),
    );
  }
}
