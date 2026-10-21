import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/common/network/network_info.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_api.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_local.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';

@LazySingleton(as: ICharactersRepository)
class CharactersRepositoryImpl implements ICharactersRepository {
  final ICharactersApi charactersApiImpl;
  final ICharactersLocal charactersLocalImpl;
  final INetworkInfo networkInfo;

  const CharactersRepositoryImpl({
    required this.charactersApiImpl,
    required this.charactersLocalImpl,
    required this.networkInfo,
  });

  Future<BaseEntity<List<Character>>> _resolve({
    required FutureOr<BaseEntity<List<Character>>> Function() loadApi,
    FutureOr<BaseEntity<List<Character>>> Function()? loadLocal,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return await loadApi();
      } else if (loadLocal != null) {
        return await loadLocal();
      }
      return BaseEntity(entity: <Character>[]);
    } on AppException catch (e) {
      return BaseEntity(exception: e);
    }
  }

  @override
  Future<BaseEntity<List<Character>>> getCharacters(int page) => _resolve(
    loadApi: () async {
      final remoteChars = await charactersApiImpl.getCharacters(page);
      await charactersLocalImpl.setCachedModels(remoteChars);
      return BaseEntity(
        entity: remoteChars.map((e) => e.toCharacter()).toList(),
      );
    },
    loadLocal: () async {
      final cachedChars = await charactersLocalImpl.getCachedModels();
      return BaseEntity(
        entity: cachedChars.map((e) => e.toCharacter()).toList(),
      );
    },
  );

  @override
  Future<BaseEntity<List<Character>>> searchCharacters((String, int) params) =>
      _resolve(
        loadApi: () async {
          final remoteChars = await charactersApiImpl.searchCharacters(params);
          return BaseEntity(
            entity: remoteChars.map((e) => e.toCharacter()).toList(),
          );
        },
      );
}
