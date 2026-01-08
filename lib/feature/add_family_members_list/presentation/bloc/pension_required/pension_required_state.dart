
import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';

abstract class PensionRequiredState {}

class PensionRequiredInitial extends PensionRequiredState {}

class PensionRequiredLoading extends PensionRequiredState {}

class PensionRequiredLoaded extends PensionRequiredState {
  final List<MemberDropItem> items;
  PensionRequiredLoaded(this.items);
}

class PensionRequiredError extends PensionRequiredState {
  final String message;
  PensionRequiredError(this.message);
}
