import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';

abstract class FilterRepository {
  Future<List<FilterOption>> getFilterOptions();
  FilterSelection getInitialSelections();
  Future<Map<String, dynamic>> submitFilters(
    FilterSelection selection,
    List<FilterOption> filterOptions,
  );
}
// domain/usecases/get_filter_options.dart
class GetFilterOptions {
  final FilterRepository repository;

  GetFilterOptions(this.repository);

  Future<List<FilterOption>> call() async {
    return await repository.getFilterOptions();
  }
}