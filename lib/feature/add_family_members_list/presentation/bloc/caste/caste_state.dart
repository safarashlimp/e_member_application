import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';


abstract class CasteState {}

class CasteInitial extends CasteState {}

class CasteLoading extends CasteState {}

class CasteLoaded extends CasteState {
  final List<MemberDropItem> items;
  CasteLoaded(this.items);
}

class CasteError extends CasteState {
  final String message;
  CasteError(this.message);
}
