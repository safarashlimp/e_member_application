part of 'health_insurance_bloc.dart';

abstract class HealthInsuranceState {}

class HealthInsuranceInitial extends HealthInsuranceState {}

class HealthInsuranceLoading extends HealthInsuranceState {}

class HealthInsuranceLoaded extends HealthInsuranceState {
  final List<MemberDropItem> items;
  HealthInsuranceLoaded(this.items);
}

class HealthInsuranceError extends HealthInsuranceState {
  final String message;
  HealthInsuranceError(this.message);
}
