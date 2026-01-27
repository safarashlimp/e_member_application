import 'package:e_member_app/feature/add_family_members_list/data/model/dropdownmodel/family_member_model.dart';

abstract class QualificationState {}

class QualificationInitial extends QualificationState {}

class QualificationLoading extends QualificationState {}

class QualificationLoaded extends QualificationState {
  final List<MemberDropItem> items;
  QualificationLoaded(this.items);
}

class QualificationError extends QualificationState {
  final String message;
  QualificationError(this.message);
}
