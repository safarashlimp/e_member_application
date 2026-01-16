import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';

class SubmitFilters {
  final FilterRepository repository;

  SubmitFilters(this.repository);

  Future<void> call(FilterSelection selection) async {
    return await repository.submitFilters(selection);
  }
}
