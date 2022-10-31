import 'package:json_annotation/json_annotation.dart';
part 'hot_and_new.g.dart';

@JsonSerializable()
class HotandNew {
  int? page;
  List<HotAndNewData> results;

  HotandNew({
    this.page,
    this.results = const [],
  });

  factory HotandNew.fromJson(Map<String, dynamic> json) {
    return _$HotandNewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotandNewToJson(this);
}

@JsonSerializable()
class HotAndNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

//in case of tv service, use original name instead of original title
  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  HotAndNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory HotAndNewData.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
