import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.g.dart';
part 'downloads.freezed.dart';
//pts

@freezed
class Downloads with _$Downloads {
  const factory Downloads({
    @JsonKey(name: "poster_path") required String? posterPath,
  }) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
