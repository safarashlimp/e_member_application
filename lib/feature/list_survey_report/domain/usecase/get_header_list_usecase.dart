import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';
import 'package:e_member_app/feature/list_survey_report/domain/repository/header_list_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetHeaderListUsecase {
  final HeaderListRepo repository;

  GetHeaderListUsecase(this.repository);

  Future<List<HeaderItem>> call(
    String position, {
    Map<String, dynamic>? filters,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final clientId = prefs.getString('clientId') ?? '';
    final userId = prefs.getString('userId') ?? '';

    return await repository.getHeaderList(
      clientId,
      userId,
      position,
      filters: filters,
    );
  }
}