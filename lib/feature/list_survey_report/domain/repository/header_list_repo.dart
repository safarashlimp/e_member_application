import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';

abstract class HeaderListRepo {
  Future<List<HeaderItem>> getHeaderList(
    String clientId,
    String userId,
    String position,
  );
}
