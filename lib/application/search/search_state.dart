part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isLoading,
    required bool isError,
    required List<Downloads> idleList,
    required List<SearchResultData> searchResultList,
  }) = _SearchState;

  //write yourself

  factory SearchState.initial() => const SearchState(
        isLoading: false,
        isError: false,
        idleList: [],
        searchResultList: [],
      );
}
