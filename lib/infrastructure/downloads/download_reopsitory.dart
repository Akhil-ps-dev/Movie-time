import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/domain/core/api_end_points.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/domain/downloads/i_download_repo.dart';
import 'package:flutter_movie_app/domain/downloads/models/downloads.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDowloadsRepo)
class DownloadReposiatory implements IDowloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //Mapping  ---->response.data ile result map cheythu oru list aakitt
        // then Downloads models ilett mattunu

        final downloadList = (response.data['results'] as List).map(
          (e) {
            return Downloads.fromJson(e);
          },
        ).toList();

        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
