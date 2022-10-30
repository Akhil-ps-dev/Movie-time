import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'hotand_new.g.dart';

@JsonSerializable()
class HotandNew {
  int? page;
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  HotandNew({this.page, this.results, this.totalPages, this.totalResults});

  factory HotandNew.fromJson(Map<String, dynamic> json) {
    return _$HotandNewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotandNewToJson(this);
}
