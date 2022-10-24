import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:flutter_movie_app/domain/downloads/i_download_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {

  final IDowloadsRepo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccessfulOption: none(),
        ),
      );
      final Either<MainFailures, List<Downloads>> downloadOption =
          await _downloadsRepo.getDownloadsImage();
      emit(
        downloadOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessfulOption: Some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureOrSuccessfulOption: Some(Right(success))),
        ),
      );
    });
  }
}
