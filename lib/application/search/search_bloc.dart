import 'package:bloc/bloc.dart';
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
    on<Initialized>((event, emit) {
      //get trending
      _downloadRepo.getDownloadsImage();

      //show to ui
    });

/*
searchResultState
*/
    on<SearchMovie>((event, emit) {
      //call search movie api
      _searchRepo.searchMovie(movieQuery: event.movieQuery);
      //show to ui
    });
  }
}
