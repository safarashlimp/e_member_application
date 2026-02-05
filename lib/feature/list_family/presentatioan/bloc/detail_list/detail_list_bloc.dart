import 'package:e_member_app/feature/list_family/data/model/detail_list_model.dart';
import 'package:e_member_app/feature/list_family/domain/user_case/user_case.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_event.dart';
import 'package:e_member_app/feature/list_family/presentatioan/bloc/detail_list/detail_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_member_app/core/constants/pref_keys.dart';

class FamilyMemberListBloc
    extends Bloc<FamilyMemberListEvent, FamilyMemberListState> {
  final GetFamilyMemberListUsecase usecase;

  static const int pageSize = 25;
  List<dynamic> _allMembers = []; // Store all fetched members
  int _currentOffset = 0;

  FamilyMemberListBloc(this.usecase) : super(FamilyMemberListInitial()) {
    on<FetchFamilyMemberList>(_onFetchFamilyMemberList);
    on<LoadMoreFamilyMembers>(_onLoadMoreFamilyMembers);
  }

  Future<void> _onFetchFamilyMemberList(
    FetchFamilyMemberList event,
    Emitter<FamilyMemberListState> emit,
  ) async {
    emit(FamilyMemberListLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final clientId = prefs.getString(PrefKeys.clientId);

      final userId = prefs.getString(PrefKeys.userId);

      if (clientId == null || userId == null) {
        emit(
          FamilyMemberListError(
            'Session expired. Please login again.',
          ),
        );
        return;
      }

      // Fetch all members from API
      final allMembers = await usecase(
        clientId,
        userId,
        event.position,
      );

      // Store all members and reset pagination
      _allMembers = allMembers;
      _currentOffset = 0;

      // Get first 25 items
      final firstBatch =
          _allMembers.take(pageSize).toList().cast<FamilyMember>();
      final hasMore = _allMembers.length > pageSize;

      _currentOffset = firstBatch.length;

      emit(FamilyMemberListLoaded(
        firstBatch,
        hasMoreData: hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(FamilyMemberListError(e.toString()));
    }
  }

  Future<void> _onLoadMoreFamilyMembers(
    LoadMoreFamilyMembers event,
    Emitter<FamilyMemberListState> emit,
  ) async {
    // Only load more if we're in a loaded state and have more data
    if (state is! FamilyMemberListLoaded) return;

    final currentState = state as FamilyMemberListLoaded;

    // Don't load if already loading or no more data
    if (currentState.isLoadingMore || !currentState.hasMoreData) return;

    // Show loading indicator
    emit(currentState.copyWith(isLoadingMore: true));

    try {
      // Simulate network delay (remove this in production if not needed)
      await Future.delayed(const Duration(milliseconds: 500));

      // Get next batch
      final nextBatch = _allMembers
          .skip(_currentOffset)
          .take(pageSize)
          .toList()
          .cast<FamilyMember>();

      if (nextBatch.isEmpty) {
        emit(currentState.copyWith(
          isLoadingMore: false,
          hasMoreData: false,
        ));
        return;
      }

      // Combine existing and new members
      final updatedMembers = List<FamilyMember>.from(currentState.members)
        ..addAll(nextBatch);
      _currentOffset += nextBatch.length;

      final hasMore = _currentOffset < _allMembers.length;

      emit(FamilyMemberListLoaded(
        updatedMembers,
        hasMoreData: hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
    }
  }
}
