import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:flutter_movie_app/domain/downloads/i_download_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://statuspaji.com/wp-content/uploads/2021/09/Iron-Man-Full-Screen-Status-Video.mp4",
  "https://pagalstatus.com/wp-content/uploads/2021/10/Game-Of-Thrones-Dragon-Scene-Status-Video.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://statusguide.com/anykreeg/2021/04/Naruto-vs-pain-amv-whatsapp-status.mp4",
  "https://statusour.com/wp-content/uploads/2021/09/Money-Heist-Whatsapp-Status-Video-Download-Full-Screen-4k-Status-9.mp4",
  "https://gostatusguru.com/siteuploads/files/sfd25/12133/Stranger%20Things%20Whatsapp%20Status(GoStatusGuru.Com).mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];
//set to avoid multiple to come
ValueNotifier<Set<int>> likedVideosIdNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDowloadsRepo downloadsrepo) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //show loading in ui
      emit(
        const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ),
      );

      //get trending movies

      final _result = await downloadsrepo.getDownloadsImage();
      final _state = _result.fold((MainFailures f) {
        return FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> resp) {
        return FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        );
      });
      //send to ui
      emit(_state);
    });

    on<LikedVideo>((event, emit) async {
      likedVideosIdNotifier.value.add(event.id);
    });
    on<UnLikedVideo>((event, emit) async {
      likedVideosIdNotifier.value.remove(event.id);
    });
  }
}
