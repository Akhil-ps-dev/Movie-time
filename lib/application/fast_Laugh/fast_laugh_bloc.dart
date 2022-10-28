import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:flutter_movie_app/domain/downloads/i_download_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final _videosListUrl = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDowloadsRepo downloadsrepo) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //show loading in ui
      emit(
          const FastLaughState(videoList: [], isLoading: true, isError: false));

      //get trending movies

      final _result = await downloadsrepo.getDownloadsImage();
      final _state = _result.fold((MainFailures f) {
        return const FastLaughState(
            videoList: [], isLoading: false, isError: true);
      }, (List<Downloads> resp) {
        return FastLaughState(
            videoList: resp, isLoading: false, isError: false);
      });
      //send to ui
      emit(_state);
    });
  }
}
