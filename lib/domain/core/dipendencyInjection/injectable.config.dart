// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i10;
import '../../../application/fast_Laugh/fast_laugh_bloc.dart' as _i11;
import '../../../application/hot_and_new/hot_and_new_bloc.dart' as _i12;
import '../../../application/search/search_bloc.dart' as _i9;
import '../../../infrastructure/downloads/download_reopsitory.dart' as _i4;
import '../../../infrastructure/hot_and_new/hot_and_new_repository.dart' as _i6;
import '../../../infrastructure/search/search_repository.dart' as _i8;
import '../../downloads/i_download_repo.dart' as _i3;
import '../../Hot_and_New/i_hot_and_new_repo.dart' as _i5;
import '../../search/i_search_repo.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IDowloadsRepo>(() => _i4.DownloadReposiatory());
  gh.lazySingleton<_i5.IHotAndNewRepo>(() => _i6.HotAndNewRepository());
  gh.lazySingleton<_i7.ISearchRepo>(() => _i8.SearchRepository());
  gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc(
        get<_i3.IDowloadsRepo>(),
        get<_i7.ISearchRepo>(),
      ));
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i3.IDowloadsRepo>()));
  gh.factory<_i11.FastLaughBloc>(
      () => _i11.FastLaughBloc(get<_i3.IDowloadsRepo>()));
  gh.factory<_i12.HotAndNewBloc>(
      () => _i12.HotAndNewBloc(get<_i5.IHotAndNewRepo>()));
  return get;
}
