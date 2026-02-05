import 'package:e_member_app/feature/list_survey_report/data/model/header_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_member_app/feature/list_survey_report/domain/usecase/get_header_list_usecase.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_event.dart';
import 'package:e_member_app/feature/list_survey_report/presentation/bloc/header_list/header_list_state.dart';

class HeaderListBloc extends Bloc<HeaderListEvent, HeaderListState> {
  final GetHeaderListUsecase getHeaderListUsecase;

  static const int pageSize = 25;
  List<HeaderItem> _allItems = [];
  int _currentOffset = 0;

  HeaderListBloc(this.getHeaderListUsecase) : super(HeaderListInitial()) {
    on<FetchHeaderList>(_onFetchHeaderList);
    on<ApplyFilters>(_onApplyFilters);
    on<ClearFilters>(_onClearFilters);
    on<LoadMoreHeaders>(_onLoadMoreHeaders);
  }

  Future<void> _onFetchHeaderList(
    FetchHeaderList event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());

    try {
      // Fetch all items from API
      final allItems = await getHeaderListUsecase(
        event.position,
        filters: event.filters,
      );

      // Store all items and reset pagination
      _allItems = allItems;
      _currentOffset = 0;

      // Get first 25 items
      final firstBatch = _allItems.take(pageSize).toList();
      final hasMore = _allItems.length > pageSize;

      _currentOffset = firstBatch.length;

      emit(HeaderListLoaded(
        firstBatch,
        appliedFilters: event.filters,
        hasMoreData: hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }

  Future<void> _onApplyFilters(
    ApplyFilters event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());

    try {
      // Fetch all filtered items from API
      final allItems = await getHeaderListUsecase(
        event.position,
        filters: event.filters,
      );

      // Store all items and reset pagination
      _allItems = allItems;
      _currentOffset = 0;

      // Get first 25 items
      final firstBatch = _allItems.take(pageSize).toList();
      final hasMore = _allItems.length > pageSize;

      _currentOffset = firstBatch.length;

      emit(HeaderListLoaded(
        firstBatch,
        appliedFilters: event.filters,
        hasMoreData: hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }

  Future<void> _onClearFilters(
    ClearFilters event,
    Emitter<HeaderListState> emit,
  ) async {
    emit(HeaderListLoading());

    try {
      // Fetch all items without filters
      final allItems = await getHeaderListUsecase(event.position);

      // Store all items and reset pagination
      _allItems = allItems;
      _currentOffset = 0;

      // Get first 25 items
      final firstBatch = _allItems.take(pageSize).toList();
      final hasMore = _allItems.length > pageSize;

      _currentOffset = firstBatch.length;

      emit(HeaderListLoaded(
        firstBatch,
        hasMoreData: hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(HeaderListError(e.toString()));
    }
  }

  Future<void> _onLoadMoreHeaders(
    LoadMoreHeaders event,
    Emitter<HeaderListState> emit,
  ) async {
    // Only load more if we're in a loaded state and have more data
    if (state is! HeaderListLoaded) return;

    final currentState = state as HeaderListLoaded;

    // Don't load if already loading or no more data
    if (currentState.isLoadingMore || !currentState.hasMoreData) return;

    // Show loading indicator
    emit(currentState.copyWith(isLoadingMore: true));

    try {
      // Simulate network delay (optional - remove if not needed)
      await Future.delayed(const Duration(milliseconds: 500));

      // Get next batch
      final nextBatch = _allItems.skip(_currentOffset).take(pageSize).toList();

      if (nextBatch.isEmpty) {
        emit(currentState.copyWith(
          isLoadingMore: false,
          hasMoreData: false,
        ));
        return;
      }

      // Combine existing and new items
      final updatedItems = List<HeaderItem>.from(currentState.items)
        ..addAll(nextBatch);
      _currentOffset += nextBatch.length;

      final hasMore = _currentOffset < _allItems.length;

      emit(HeaderListLoaded(
        updatedItems,
        appliedFilters: currentState.appliedFilters,
        hasMoreData: hasMore,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
    }
  }
}
