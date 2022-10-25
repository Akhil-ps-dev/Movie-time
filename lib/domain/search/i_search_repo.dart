import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:flutter_movie_app/domain/search/model/search_respo/search_response/search_response.dart';

abstract class ISearchRepo {
  Future<Either<MainFailures, SearchResponse>> searchMovie({
    //movieQuery is passing to search movie
    required String movieQuery,
  });
}
