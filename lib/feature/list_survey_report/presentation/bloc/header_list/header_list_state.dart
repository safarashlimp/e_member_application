import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';

abstract class HeaderListState {}

class HeaderListInitial extends HeaderListState {}

class HeaderListLoading extends HeaderListState {}

class HeaderListLoaded extends HeaderListState {
  final List<HeaderItem> items;
  final Map<String, dynamic>? appliedFilters;
  final bool hasMoreData;
  final bool isLoadingMore;

  HeaderListLoaded(
    this.items, {
    this.appliedFilters,
    this.hasMoreData = true,
    this.isLoadingMore = false,
  });

  bool get hasFilters => appliedFilters != null && appliedFilters!.isNotEmpty;

  HeaderListLoaded copyWith({
    List<HeaderItem>? items,
    Map<String, dynamic>? appliedFilters,
    bool? hasMoreData,
    bool? isLoadingMore,
    bool clearFilters = false,
  }) {
    return HeaderListLoaded(
      items ?? this.items,
      appliedFilters:
          clearFilters ? null : (appliedFilters ?? this.appliedFilters),
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class HeaderListError extends HeaderListState {
  final String message;

  HeaderListError(this.message);
}
