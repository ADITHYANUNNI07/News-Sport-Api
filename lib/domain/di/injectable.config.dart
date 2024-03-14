// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/home/home_bloc.dart' as _i7;
import '../../infrastrcture/categories_country/categories_repository.dart'
    as _i4;
import '../../infrastrcture/home/home_repository.dart' as _i6;
import '../categories_and_country/categories_and_country.dart' as _i3;
import '../home/home_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.CategoriesAndCountryService>(
      () => _i4.CategoriesCountryImplement());
  gh.lazySingleton<_i5.HomeService>(() => _i6.HomeImplementation());
  gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc(
        get<_i5.HomeService>(),
        get<_i3.CategoriesAndCountryService>(),
      ));
  return get;
}
