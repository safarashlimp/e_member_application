import 'package:e_member_app/feature/dash_board/domain/entity/dashboard_entity.dart';
import 'package:e_member_app/feature/dash_board/domain/repository/dash_board_repository.dart';

class GetDashboardUseCase {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  Future<DashboardEntity> call(String clientId, String userId) {
    return repository.getDashboard(clientId: clientId, userId: userId);
  }
}
