import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';

abstract class HeaderListState {}

class HeaderListInitial extends HeaderListState {}

class HeaderListLoading extends HeaderListState {}

class HeaderListLoaded extends HeaderListState {
  final List<HeaderItem> items;
  final Map<String, dynamic>? appliedFilters;

  HeaderListLoaded(this.items, {this.appliedFilters});

  bool get hasFilters => appliedFilters != null && appliedFilters!.isNotEmpty;
}

class HeaderListError extends HeaderListState {
  final String message;

  HeaderListError(this.message);
}