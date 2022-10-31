import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/Hot_and_New/i_hot_and_new_repo.dart';
import '../../domain/Hot_and_New/models/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHotAndNewRepo _homeRepo;
  HomeBloc(this._homeRepo) : super(HomeState.initial()) {
    // get home screen data
    on<GetHomeScreenData>((event, emit) async {
      log('GETTING HOME SCREEN DATA');
//show loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final _movieResult = await _homeRepo.getHotandNewMovieData();
      final _tvResult = await _homeRepo.getHotandNewTvData();

      //transform data
      final _state1 = _movieResult.fold(
        (MainFailures f) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotandNew res) {
          final pastYear = res.results;
          final trending = res.results;
          final dramas = res.results;
          final southIndian = res.results;

          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramaMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);

      final _state2 = _tvResult.fold((MainFailures f) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotandNew res) {
        final top10List = res.results;

        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: state.tenseDramaMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTvList: top10List,
          isLoading: false,
          hasError: false,
        );
      });
      emit(_state2);
      //send to ui
    });
  }
}
