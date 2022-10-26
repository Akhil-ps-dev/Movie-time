import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/domain/search/i_search_repo.dart';
import 'package:injectable/injectable.dart';
import '../../domain/core/api_end_points.dart';
import '../../domain/search/model/search_response/search_response.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository implements ISearchRepo {
  @override
  Future<Either<MainFailures, SearchResponse>> searchMovie(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});
      if (response.statusCode == 200 || response.statusCode == 201) {
        //.data is in dio and .body is in http
        final result = SearchResponse.fromJson(response.data);
        print(result);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
