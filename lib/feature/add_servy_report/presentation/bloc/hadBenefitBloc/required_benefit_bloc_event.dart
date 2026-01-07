

import 'package:equatable/equatable.dart';

abstract class RequiredBenefitEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRequiredBenefits extends RequiredBenefitEvent {}
