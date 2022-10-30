import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/domain/core/failures/main_failure.dart';

import 'models/hot_and_new.dart';

abstract class IHotAndNewRepo {
  Future<Either<MainFailures, HotandNew>> getHotandNewMovieData();
  Future<Either<MainFailures, HotandNew>> getHotandNewTvData();
}
