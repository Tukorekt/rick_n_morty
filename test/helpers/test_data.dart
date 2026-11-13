import 'dart:async';

import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/common/network/network_info.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_api.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_local.dart';
import 'package:rick_n_morty/data/models/base_response/base_response_model.dart';
import 'package:rick_n_morty/data/models/character/character_model.dart';
import 'package:rick_n_morty/data/models/info/info_model.dart';
import 'package:rick_n_morty/data/models/location/location_model.dart';
import 'package:rick_n_morty/data/models/origin/origin_model.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/base_response.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/entities/info.dart';
import 'package:rick_n_morty/domain/entities/location.dart';
import 'package:rick_n_morty/domain/entities/origin.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';

// ---------------------------------------------------------------------------
// JSON fixtures
// ---------------------------------------------------------------------------

Map<String, dynamic> characterJson({
  int id = 1,
  String name = 'Rick Sanchez',
  String? image = 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
}) => <String, dynamic>{
  'id': id,
  'name': name,
  'status': 'Alive',
  'species': 'Human',
  'type': '',
  'gender': 'Male',
  'image': image,
  'url': 'https://rickandmortyapi.com/api/character/$id',
  'created': '2017-11-04T18:48:46.250Z',
  'origin': {
    'name': 'Earth (C-137)',
    'url': 'https://rickandmortyapi.com/api/location/1',
  },
  'location': {
    'name': 'Citadel of Ricks',
    'url': 'https://rickandmortyapi.com/api/location/3',
  },
  'episode': [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
};

Map<String, dynamic> charactersResponseJson({
  List<Map<String, dynamic>>? results,
  Map<String, dynamic>? info,
}) => <String, dynamic>{
  'info': info ?? {'count': 826, 'pages': 42, 'next': null, 'prev': null},
  'results': results ?? [characterJson()],
};

// ---------------------------------------------------------------------------
// Model builders
// ---------------------------------------------------------------------------

CharacterModel buildCharacterModel({
  int id = 1,
  String name = 'Rick Sanchez',
  String? image = 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
}) => CharacterModel(
  id: id,
  name: name,
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  image: image,
  url: 'https://rickandmortyapi.com/api/character/$id',
  created: '2017-11-04T18:48:46.250Z',
  originModel: buildOriginModel(),
  locationModel: buildLocationModel(),
  episodesUrls: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
);

InfoModel buildInfoModel({
  int count = 826,
  int pages = 42,
  String? next,
  String? prev,
}) => InfoModel(count: count, pages: pages, next: next, prev: prev);

LocationModel buildLocationModel({
  int id = 3,
  String name = 'Citadel of Ricks',
}) => LocationModel(
  id: id,
  name: name,
  type: 'Space station',
  dimension: 'unknown',
  url: 'https://rickandmortyapi.com/api/location/$id',
  created: '2017-11-10T13:08:13.191Z',
  residents: const ['https://rickandmortyapi.com/api/character/1'],
);

OriginModel buildOriginModel({
  String name = 'Earth (C-137)',
  String url = 'https://rickandmortyapi.com/api/location/1',
}) => OriginModel(name: name, url: url);

BaseResponseModel<List<CharacterModel>> buildCharactersResponseModel({
  List<CharacterModel>? results,
  InfoModel? info,
}) => BaseResponseModel<List<CharacterModel>>(
  info: info,
  results: results ?? [buildCharacterModel()],
);

// ---------------------------------------------------------------------------
// Entity builders
// ---------------------------------------------------------------------------

Character buildCharacter({
  int id = 1,
  String name = 'Rick Sanchez',
  String? image,
}) => Character(
  id: id,
  name: name,
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  image: image,
  url: 'https://rickandmortyapi.com/api/character/$id',
  created: '2017-11-04T18:48:46.250Z',
  origin: buildOrigin(),
  location: buildLocation(),
  episodesUrls: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
);

Info buildInfo({int count = 826, int pages = 42, String? next, String? prev}) =>
    Info(count: count, pages: pages, next: next, prev: prev);

Location buildLocation({int id = 3, String name = 'Citadel of Ricks'}) =>
    Location(
      id: id,
      name: name,
      type: 'Space station',
      dimension: 'unknown',
      url: 'https://rickandmortyapi.com/api/location/$id',
      created: '2017-11-10T13:08:13.191Z',
      residents: const ['https://rickandmortyapi.com/api/character/1'],
    );

Origin buildOrigin({
  String name = 'Earth (C-137)',
  String url = 'https://rickandmortyapi.com/api/location/1',
}) => Origin(name: name, url: url);

BaseResponse<List<Character>> buildCharactersResponse({
  List<Character>? results,
  Info? info,
}) => BaseResponse(info: info, results: results ?? [buildCharacter()]);

BaseEntity<CharactersResponse> buildSuccessEntity({
  List<Character>? results,
  Info? info,
}) => BaseEntity(
  entity: buildCharactersResponse(results: results, info: info),
);

BaseEntity<CharactersResponse> buildFailureEntity(AppException exception) =>
    BaseEntity(exception: exception);

// ---------------------------------------------------------------------------
// Fakes
// ---------------------------------------------------------------------------

class FakeNetworkInfo implements INetworkInfo {
  FakeNetworkInfo({this.connected = true});

  bool connected;
  int calls = 0;

  @override
  Future<bool> get isConnected async {
    calls++;
    return connected;
  }
}

typedef GetCharactersHandler = Future<CharactersModelResponse> Function(
  int page,
);
typedef SearchCharactersHandler = Future<CharactersModelResponse> Function(
  (String, int) params,
);

class FakeCharactersApi implements ICharactersApi {
  FakeCharactersApi({this.onGetCharacters, this.onSearchCharacters});

  GetCharactersHandler? onGetCharacters;
  SearchCharactersHandler? onSearchCharacters;

  final List<int> requestedPages = [];
  final List<(String, int)> searchRequests = [];

  @override
  Future<CharactersModelResponse> getCharacters(int page) {
    requestedPages.add(page);
    final handler = onGetCharacters;
    return handler != null
        ? handler(page)
        : Future.value(buildCharactersResponseModel());
  }

  @override
  Future<CharactersModelResponse> searchCharacters((String, int) params) {
    searchRequests.add(params);
    final handler = onSearchCharacters;
    return handler != null
        ? handler(params)
        : Future.value(buildCharactersResponseModel());
  }
}

class FakeCharactersLocal implements ICharactersLocal {
  List<CharacterModel>? models;
  AppException? loadError;
  final List<List<CharacterModel>?> saved = [];

  @override
  Future<List<CharacterModel>> getCachedModels() async {
    final error = loadError;
    if (error != null) throw error;

    final data = models;
    if (data == null) throw CacheException('No data', CharacterModel);
    return data;
  }

  @override
  Future<void> setCachedModels(List<CharacterModel>? models) async {
    saved.add(models);
    if (models != null) this.models = models;
  }
}

typedef GetCharactersRepositoryHandler =
    Future<BaseEntity<CharactersResponse>> Function(int page);
typedef SearchCharactersRepositoryHandler =
    Future<BaseEntity<CharactersResponse>> Function((String, int) params);

class FakeCharactersRepository implements ICharactersRepository {
  FakeCharactersRepository({this.onGetCharacters, this.onSearchCharacters});

  GetCharactersRepositoryHandler? onGetCharacters;
  SearchCharactersRepositoryHandler? onSearchCharacters;

  final List<int> requestedPages = [];
  final List<(String, int)> searchRequests = [];

  @override
  Future<BaseEntity<CharactersResponse>> getCharacters(int page) {
    requestedPages.add(page);
    final handler = onGetCharacters;
    return handler != null ? handler(page) : Future.value(buildSuccessEntity());
  }

  @override
  Future<BaseEntity<CharactersResponse>> searchCharacters(
    (String, int) params,
  ) {
    searchRequests.add(params);
    final handler = onSearchCharacters;
    return handler != null
        ? handler(params)
        : Future.value(buildSuccessEntity());
  }
}
