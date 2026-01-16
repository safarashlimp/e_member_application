import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_option.dart';
import 'package:e_member_app/feature/drawer/add_servay_items/domain/entity/filter_selection.dart';

abstract class FilterRepository {
  List<FilterOption> getFilterOptions();
  FilterSelection getInitialSelections();
  Future<void> submitFilters(FilterSelection selection);
}

// domain/usecases/get_filter_options.dart
class GetFilterOptions {
  final FilterRepository repository;

  GetFilterOptions(this.repository);

  List<FilterOption> call() {
    return repository.getFilterOptions();
  }
}