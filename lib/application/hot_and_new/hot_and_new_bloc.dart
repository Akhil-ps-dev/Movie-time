import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/domain/Hot_and_New/i_hot_and_new_repo.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/Hot_and_New/models/hot_and_new.dart';
part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final IHotAndNewRepo hotAndNewRepo;
  HotAndNewBloc(this.hotAndNewRepo) : super(HotAndNewState.initial()) {
    // GetHotandNewMovieData
    //get hot and movie data
    on<LoadDataInComingSoon>(
      (event, emit) async {
        //show loading to ui
        emit(
          const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: true,
            hasError: false,
          ),
        );

        //get data from remote
        final _result = await hotAndNewRepo.getHotandNewMovieData();

        // data to state

        final newState = _result.fold(
          (MainFailures f) {
            return const HotAndNewState(
                comingSoonList: [],
                everyOneIsWatchingList: [],
                isLoading: false,
                hasError: true);
          },
          (HotandNew res) {
            return HotAndNewState(
              comingSoonList: res.results,
              everyOneIsWatchingList: state.everyOneIsWatchingList,
              isLoading: false,
              hasError: false,
            );
          },
        );
        emit(newState);
      },
    );

    //GetHotandNeeTvData
    on<LoadDataInEveryOneIsWatching>(
      (event, emit) async {
        //show loading to ui
        emit(
          const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: true,
            hasError: false,
          ),
        );

        //get data from remote
        final _result = await hotAndNewRepo.getHotandNewTvData();

        // data to state

        final newState = _result.fold(
          (MainFailures f) {
            return const HotAndNewState(
                comingSoonList: [],
                everyOneIsWatchingList: [],
                isLoading: false,
                hasError: true);
          },
          (HotandNew res) {
            return HotAndNewState(
              comingSoonList: state.comingSoonList,
              everyOneIsWatchingList: res.results,
              isLoading: false,
              hasError: false,
            );
          },
        );
        emit(newState);
      },
    );
  }
}
