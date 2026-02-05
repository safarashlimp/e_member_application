import 'package:e_member_app/feature/add_servy_report/data/model/family_dropdown_model.dart';
import 'package:equatable/equatable.dart';

abstract class RequiredBenefitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequiredBenefitInitial extends RequiredBenefitState {}

class RequiredBenefitLoading extends RequiredBenefitState {
  final String screenName;
  RequiredBenefitLoading(this.screenName);
}

class RequiredBenefitLoaded extends RequiredBenefitState {
  final List<FamilyDropItem> items;

  RequiredBenefitLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

class RequiredBenefitError extends RequiredBenefitState {
  final String message;

  RequiredBenefitError({required this.message});

  @override
  List<Object?> get props => [message];
}
