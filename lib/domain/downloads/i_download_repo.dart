import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';
import 'models/downloads.dart';

//either failures or success in api call
abstract class IDowloadsRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage();
  
}
