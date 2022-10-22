import 'package:dio/dio.dart';
import 'package:flutter_movie_app/domain/core/api_end_points.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/domain/downloads/i_download_repo.dart';
import 'package:flutter_movie_app/domain/downloads/models/downloads.dart';

class DownloadReposiatory implements IDowloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadlist = [];

        for (final raw in response.data) {
          //adding values to []
          downloadlist.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadlist);
        return Right(downloadlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
