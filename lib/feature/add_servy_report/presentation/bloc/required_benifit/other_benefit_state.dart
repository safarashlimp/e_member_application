import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';

abstract class OtherBenefitState {}

class OtherBenefitInitial extends OtherBenefitState {}

class OtherBenefitLoading extends OtherBenefitState {}

class OtherBenefitLoaded extends OtherBenefitState {
  final List<FamilyDropItem> items;
  OtherBenefitLoaded(this.items);
}

class OtherBenefitError extends OtherBenefitState {
  final String message;
  OtherBenefitError(this.message);
}
