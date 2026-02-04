import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';

abstract class FamilyMemberListState {}

class FamilyMemberListInitial extends FamilyMemberListState {}

class FamilyMemberListLoading extends FamilyMemberListState {}

class FamilyMemberListLoaded extends FamilyMemberListState {
  final List<FamilyMember> members;
  final bool hasMoreData;
  final bool isLoadingMore;

  FamilyMemberListLoaded(
    this.members, {
    this.hasMoreData = true,
    this.isLoadingMore = false,
  });

  FamilyMemberListLoaded copyWith({
    List<FamilyMember>? members,
    bool? hasMoreData,
    bool? isLoadingMore,
  }) {
    return FamilyMemberListLoaded(
      members ?? this.members,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class FamilyMemberListError extends FamilyMemberListState {
  final String message;

  FamilyMemberListError(this.message);
}
