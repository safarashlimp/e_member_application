import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/repository/filter_repository.dart';

class SubmitFilters {
  final FilterRepository repository;

  SubmitFilters(this.repository);

  Future<Map<String, dynamic>> call(
    FilterSelection selection,
    List<FilterOption> filterOptions,
  ) async {
    return await repository.submitFilters(selection, filterOptions);
  }
}