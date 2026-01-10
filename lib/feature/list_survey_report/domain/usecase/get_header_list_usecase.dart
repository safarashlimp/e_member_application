import 'package:e_member_app/feature/list_survey_report/domain/repository/header_list_repo.dart';
import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';

class GetHeaderListUsecase {
  final HeaderListRepo repo;

  GetHeaderListUsecase(this.repo);

  Future<List<HeaderItem>> call(
    String clientId,
    String userId,
    String position,
  ) {
    return repo.getHeaderList(clientId, userId, position);
  }
}
