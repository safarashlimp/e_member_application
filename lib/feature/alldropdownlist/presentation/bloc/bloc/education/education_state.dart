part of 'education_bloc.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationLoaded extends EducationState {
  final List<MemberDropItem> items;
  EducationLoaded(this.items);
}

class EducationError extends EducationState {
  final String message;
  EducationError(this.message);
}
