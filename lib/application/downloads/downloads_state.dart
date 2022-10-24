part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    //loading screen
    required bool isLoading,
    //result inte state
    required List<Downloads> downloads,
    //option (curretly error or success shows in UI)
    //optin some or none
    required Option<Either<MainFailures, List<Downloads>>>
        downloadsFailureOrSuccessfulOption,
  }) = _DownloadsState;
//then create a inintial state

  factory DownloadsState.inital() {
    return const DownloadsState(
      isLoading: false,
      downloadsFailureOrSuccessfulOption: None(),
      downloads: [],
    );
  }
}
