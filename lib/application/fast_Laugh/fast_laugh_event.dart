part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.likedVideo({required int id}) = LikedVideo;
  const factory FastLaughEvent.unLikedVideo({required int id}) = UnLikedVideo;
}
