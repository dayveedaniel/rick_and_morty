// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/local/shared_prefs/shared_prefs_provider.dart' as _i737;
import '../data/remote/http/api_provider.dart' as _i780;
import '../data/remote/http/core/http_client.dart' as _i586;
import '../data/remote/http/core/i_http_client.dart' as _i64;
import '../features/characters/application/character_service.dart' as _i917;
import '../features/characters/domain/character_model.dart' as _i119;
import '../features/characters/presentation/character_details_store/character_details_store.dart'
    as _i74;
import '../features/characters/presentation/characters_list_store/characters_store.dart'
    as _i32;
import '../features/favourite/application/favourite_service.dart' as _i411;
import '../features/favourite/presentation/store/favourite_store.dart' as _i59;
import '../utils/log_service.dart' as _i359;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i780.ApiProvider>(() => _i780.ApiProvider());
    gh.lazySingleton<_i737.SharedPreferenceProvider>(
        () => _i737.SharedPreferenceProvider());
    gh.factory<_i359.LogService>(
      () => _i359.LogServiceDev(),
      registerFor: {
        _dev,
        _test,
      },
    );
    gh.factory<_i64.BaseHttpClient>(
      () => _i586.MHttpClient(),
      registerFor: {_dev},
    );
    gh.factory<_i917.CharacterService>(
        () => _i917.CharacterService(gh<_i780.ApiProvider>()));
    gh.factory<_i359.LogService>(
      () => _i359.LogServiceProd(),
      registerFor: {_prod},
    );
    gh.factory<_i411.FavouriteService>(
        () => _i411.FavouriteService(gh<_i737.SharedPreferenceProvider>()));
    gh.factoryParam<_i74.CharacterDetailsStore, _i119.CharacterModel, dynamic>((
      characterModel,
      _,
    ) =>
        _i74.CharacterDetailsStore(
          gh<_i917.CharacterService>(),
          characterModel,
        ));
    gh.factory<_i32.CharactersStore>(
        () => _i32.CharactersStore(gh<_i917.CharacterService>()));
    gh.factoryParam<_i59.FavouriteStore, int, dynamic>((
      characterId,
      _,
    ) =>
        _i59.FavouriteStore(
          gh<_i411.FavouriteService>(),
          characterId,
        ));
    return this;
  }
}
