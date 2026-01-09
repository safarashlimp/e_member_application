import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';

class HeaderMapper {
  static SurveyHeaderModel fromApi(Map<String, dynamic> json) {
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
      hasJobCard: int.parse(data['has_job_card'].toString()),
      kudumbashreeMember:
          int.parse(data['kudumbashree_member'].toString()),
      govtBeneficiary:
          int.parse(data['govt_beneficiary'].toString()),
      extremePoor:
          int.parse(data['extreme_poor'].toString()),
    );
  }
}
