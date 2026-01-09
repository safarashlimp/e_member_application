import 'package:e_member_app/feature/alldropdownlist/data/model/family_member_model.dart';


abstract class MaritalStatusState {}

class MaritalStatusInitial extends MaritalStatusState {}

class MaritalStatusLoading extends MaritalStatusState {}

class MaritalStatusLoaded extends MaritalStatusState {
  final List<MemberDropItem> items;
  MaritalStatusLoaded(this.items);
}

class MaritalStatusError extends MaritalStatusState {
  final String message;
  MaritalStatusError(this.message);
}
