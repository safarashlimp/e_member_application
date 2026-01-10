import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';

abstract class HeaderListState {}

class HeaderListInitial extends HeaderListState {}

class HeaderListLoading extends HeaderListState {}

class HeaderListLoaded extends HeaderListState {
  final List<HeaderItem> items;

  HeaderListLoaded(this.items);
}

class HeaderListError extends HeaderListState {
  final String message;

  HeaderListError(this.message);
}
