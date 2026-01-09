import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';

class HeaderMapper {
  static SurveyHeaderModel fromApi(Map<String, dynamic> json) {
    final data = json['data'] ?? json;

    return SurveyHeaderModel(
      houseChief: data['house_chief'] ?? '',
      houseNumber: data['house_number'] ?? '',
      houseName: data['house_name'] ?? '',
      rationCardNumber: data['ration_card_number'] ?? '',
      rationCardTypeId: data['ration_card_type_id']?.toString() ?? '',
      annualIncome: data['annual_income'].toString(),
      hasJobCard: int.tryParse(data['has_job_card']?.toString() ?? '0') ?? 0,
      kudumbashreeMember:
          int.tryParse(data['kudumbashree_member']?.toString() ?? '0') ?? 0,
      govtBeneficiary:
          int.tryParse(data['govt_beneficiary']?.toString() ?? '0') ?? 0,
      extremePoor:
          int.tryParse(data['extreme_poor']?.toString() ?? '0') ?? 0,
    );
  }
}
