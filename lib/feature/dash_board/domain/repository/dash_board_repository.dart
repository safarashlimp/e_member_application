import 'package:e_member_app/feature/dash_board/domain/entity/dashboard_entity.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getDashboard({
    required String clientId,
    required String userId,
  });
}
