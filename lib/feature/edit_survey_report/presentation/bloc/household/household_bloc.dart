import 'package:e_member_app/feature/add_servy_report/data/model/screen1_data_model.dart';

abstract class HouseholdSubmitEvent {}

class SubmitHouseholdEvent extends HouseholdSubmitEvent {
  final SurveyHeaderModel data;
  final int? editId;

  SubmitHouseholdEvent({
    required this.data,
    this.editId,
  });
}
  