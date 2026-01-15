abstract class FamilyMemberDetailLoadState {}

class FamilyMemberDetailLoadInitial extends FamilyMemberDetailLoadState {}

class FamilyMemberDetailLoadLoading extends FamilyMemberDetailLoadState {}

class FamilyMemberDetailLoadLoaded extends FamilyMemberDetailLoadState {
  final Map<String, dynamic> data;
  FamilyMemberDetailLoadLoaded(this.data);
}

class FamilyMemberDetailLoadError extends FamilyMemberDetailLoadState {
  final String message;
  FamilyMemberDetailLoadError(this.message);
}