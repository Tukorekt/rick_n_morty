import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/network/network_info.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_api.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_local.dart';
import 'package:rick_n_morty/data/repositories/repositorues_mixins.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/base_response.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';

@LazySingleton(as: ICharactersRepository)
class CharactersRepositoryImpl
    with ResolveMixin<CharactersModelResponse, CharactersResponse>
    implements ICharactersRepository {
  final ICharactersApi charactersApiImpl;
  final ICharactersLocal charactersLocalImpl;
  @override
  final INetworkInfo networkInfo;

  const CharactersRepositoryImpl({
    required this.charactersApiImpl,
    required this.charactersLocalImpl,
    required this.networkInfo,
  });

  @override
  Future<BaseEntity<CharactersResponse>> getCharacters(int page) =>
      resolveLoading(
        loadApi: () async {
          final remoteChars = await charactersApiImpl.getCharacters(page);
          await charactersLocalImpl.setCachedModels(remoteChars.results);
          return convertToEntity(remoteChars);
        },
        loadLocal: () async {
          final cachedChars = await charactersLocalImpl.getCachedModels();
          return BaseEntity(
            entity: BaseResponse(
              results: cachedChars.map((e) => e.toCharacter).toList(),
            ),
          );
        },
      );

  @override
  Future<BaseEntity<CharactersResponse>> searchCharacters(
    (String, int) params,
  ) => resolveLoading(
    loadApi: () async {
      final remoteChars = await charactersApiImpl.searchCharacters(params);
      return convertToEntity(remoteChars);
    },
  );

  @override
  BaseEntity<CharactersResponse> convertToEntity(
    CharactersModelResponse model,
  ) => BaseEntity(
    entity: model.toBaseResponse((v) => v.map((e) => e.toCharacter).toList()),
  );
}
