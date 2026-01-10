import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';

abstract class HeaderListRemoteDatasource {
  Future<HeaderListResponse> getHeaderList({
    required String clientId,
    required String userId,
    required String position,
  });
}
