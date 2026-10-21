// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_n_morty/app/di/register_module.dart' as _i194;
import 'package:rick_n_morty/common/network/network_info.dart' as _i1072;
import 'package:rick_n_morty/data/datasources/characters/characters_api.dart'
    as _i191;
import 'package:rick_n_morty/data/datasources/characters/characters_local.dart'
    as _i471;
import 'package:rick_n_morty/data/repositories/characters_repository_impl.dart'
    as _i948;
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart'
    as _i218;
import 'package:rick_n_morty/domain/usecase/get_characters_use_case.dart'
    as _i374;
import 'package:rick_n_morty/domain/usecase/search_characters_use_case.dart'
    as _i476;
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_cubit.dart'
    as _i980;
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_cubit.dart'
    as _i414;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i1072.INetworkInfo>(() => registerModule.networkInfo);
    gh.lazySingleton<_i191.ICharactersApi>(
      () => _i191.CharactersApiImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i471.ICharactersLocal>(
      () => _i471.CharactersLocalImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i218.ICharactersRepository>(
      () => _i948.CharactersRepositoryImpl(
        charactersApiImpl: gh<_i191.ICharactersApi>(),
        charactersLocalImpl: gh<_i471.ICharactersLocal>(),
        networkInfo: gh<_i1072.INetworkInfo>(),
      ),
    );
    gh.factory<_i374.GetCharactersUseCase>(
      () => _i374.GetCharactersUseCase(
        charactersRepository: gh<_i218.ICharactersRepository>(),
      ),
    );
    gh.factory<_i476.SearchCharactersUseCase>(
      () => _i476.SearchCharactersUseCase(
        charactersRepository: gh<_i218.ICharactersRepository>(),
      ),
    );
    gh.factory<_i980.CharactersListCubit>(
      () => _i980.CharactersListCubit(gh<_i374.GetCharactersUseCase>()),
    );
    gh.factory<_i414.SearchCharactersCubit>(
      () => _i414.SearchCharactersCubit(gh<_i476.SearchCharactersUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i194.RegisterModule {}
