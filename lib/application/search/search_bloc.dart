import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/downloads/i_download_repo.dart';
import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/i_search_repo.dart';
import '../../domain/search/model/search_response/search_response.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDowloadsRepo _downloadRepo;
  final ISearchRepo _searchRepo;

  SearchBloc(this._downloadRepo, this._searchRepo)
      : super(SearchState.initial()) {
/*
idle state
 */
    on<Initialized>((event, emit) async {
      //get trending
      if (state.idleList.isNotEmpty) {
        emit(
          state.copyWith(
            idleList: state.idleList,
            searchResultList: [],
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          idleList: [],
          searchResultList: [],
          isLoading: true,
          isError: false,
        ),
      );

      final _result = await _downloadRepo.getDownloadsImage();
      _result.fold(
        (MainFailures f) {
          emit(
            state.copyWith(
              idleList: [],
              searchResultList: [],
              isLoading: false,
              isError: true,
            ),
          );
        },
        (List<Downloads> list) {
          emit(
            state.copyWith(
              idleList: list,
              searchResultList: [],
              isLoading: false,
              isError: false,
            ),
          );
        },
      );

      //show to ui
    });

/*
searchResultState
*/
    on<SearchMovie>((event, emit) async {
      //call search movie api
      log('Searching for ${event.movieQuery}');
      emit(const SearchState(
        idleList: [],
        searchResultList: [],
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchRepo.searchMovie(movieQuery: event.movieQuery);

      final _state = _result.fold((MainFailures f) {
        return const SearchState(
          idleList: [],
          searchResultList: [],
          isLoading: false,
          isError: true,
        );
      }, (SearchResponse r) {
        // emit(
        //   state.copyWith(
        //     idleList: [],
        //     searchResultList: r.results,
        //     isLoading: false,
        //     isError: false,
        //   ),
        // );
        return SearchState(
            isLoading: false,
            isError: false,
            idleList: [],
            searchResultList: r.results);
      });

      emit(_state);

      //show to ui
    });
  }
}
