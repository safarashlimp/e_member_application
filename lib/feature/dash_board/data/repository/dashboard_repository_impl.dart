import 'package:e_member_app/feature/dash_board/domain/repository/dashboardRepository.dart';

import '../../domain/entity/dashboard_entity.dart';
  import '../datasource/dashboard_remote_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDatasource datasource;

  DashboardRepositoryImpl(this.datasource);

  @override
  Future<DashboardEntity> getDashboard({
    required String clientId,
    required String userId,
  }) {
    return datasource.getDashboard(clientId, userId);
  }
}
