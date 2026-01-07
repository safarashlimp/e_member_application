import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class MaritalStatusState {}

class MaritalStatusInitial extends MaritalStatusState {}

class MaritalStatusLoading extends MaritalStatusState {}

class MaritalStatusLoaded extends MaritalStatusState {
  final List<FamilyDropItem> items;
  MaritalStatusLoaded(this.items);
}

class MaritalStatusError extends MaritalStatusState {
  final String message;
  MaritalStatusError(this.message);
}
