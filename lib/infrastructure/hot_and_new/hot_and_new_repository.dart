import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';

import 'package:flutter_movie_app/domain/Hot_and_New/models/hot_and_new.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/Hot_and_New/i_hot_and_new_repo.dart';
import '../../domain/core/api_end_points.dart';

@LazySingleton(as: IHotAndNewRepo)
class HotAndNewRepository implements IHotAndNewRepo {
  @override
  Future<Either<MainFailures, HotandNew>> getHotandNewMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        //.data is in dio and .body is in http
        final result = HotandNew.fromJson(response.data);
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

  ///tv api
  @override
  Future<Either<MainFailures, HotandNew>> getHotandNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        //.data is in dio and .body is in http
        final result = HotandNew.fromJson(response.data);
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
