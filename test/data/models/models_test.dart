import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/data/models/base_response/base_response_model.dart';
import 'package:rick_n_morty/data/models/character/character_model.dart';
import 'package:rick_n_morty/data/models/info/info_model.dart';
import 'package:rick_n_morty/data/models/location/location_model.dart';
import 'package:rick_n_morty/data/models/origin/origin_model.dart';
import 'package:rick_n_morty/domain/entities/base_response.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/entities/info.dart';

import '../../helpers/test_data.dart';

void main() {
  group('CharacterModel', () {
    test('fromJson parses every field including nested objects', () {
      final model = CharacterModel.fromJson(characterJson());

      expect(model.id, 1);
      expect(model.name, 'Rick Sanchez');
      expect(model.status, 'Alive');
      expect(model.species, 'Human');
      expect(model.type, '');
      expect(model.gender, 'Male');
      expect(model.image, contains('avatar/1.jpeg'));
      expect(model.url, endsWith('/character/1'));
      expect(model.created, '2017-11-04T18:48:46.250Z');
      expect(model.originModel?.name, 'Earth (C-137)');
      expect(model.locationModel?.name, 'Citadel of Ricks');
      expect(model.episodesUrls, hasLength(2));
    });

    test('fromJson falls back to an empty episode list', () {
      final json = characterJson()..remove('episode');

      final model = CharacterModel.fromJson(json);

      expect(model.episodesUrls, isEmpty);
    });

    test('toCharacter maps all nested fields', () {
      final model = buildCharacterModel(id: 42, name: 'Morty Smith');

      final character = model.toCharacter;

      expect(character.id, 42);
      expect(character.name, 'Morty Smith');
      expect(character.origin, buildOrigin());
      expect(character.location, buildLocation());
      expect(character.episodesUrls, model.episodesUrls);
    });

    test('toCharacter keeps null nested models null', () {
      final model = CharacterModel.fromJson(
        characterJson()
          ..['origin'] = null
          ..['location'] = null,
      );

      final character = model.toCharacter;

      expect(character.origin, isNull);
      expect(character.location, isNull);
    });

    test('toJson / fromJson round trip keeps the model intact', () {
      final model = buildCharacterModel();

      final restored = CharacterModel.fromJson(
        jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>,
      );

      expect(restored, model);
    });
  });

  group('InfoModel', () {
    test('fromJson parses pagination info', () {
      final model = InfoModel.fromJson({
        'count': 826,
        'pages': 42,
        'next': 'https://rickandmortyapi.com/api/character?page=2',
        'prev': null,
      });

      expect(model.count, 826);
      expect(model.pages, 42);
      expect(model.next, contains('page=2'));
      expect(model.prev, isNull);
    });

    test('toInfo maps to the domain entity', () {
      final model = buildInfoModel(
        next: '/character/?page=2',
        prev: '/character/?page=0',
      );

      final info = model.toInfo;

      expect(
        info,
        Info(
          count: 826,
          pages: 42,
          next: '/character/?page=2',
          prev: '/character/?page=0',
        ),
      );
    });
  });

  group('LocationModel', () {
    test('fromJson defaults residents to an empty list', () {
      final model = LocationModel.fromJson({
        'id': 3,
        'name': 'Citadel of Ricks',
        'type': 'Space station',
        'dimension': 'unknown',
        'url': 'https://rickandmortyapi.com/api/location/3',
        'created': '2017-11-10T13:08:13.191Z',
      });

      expect(model.residents, isEmpty);
      expect(model.toLocation.name, 'Citadel of Ricks');
    });

    test('toLocation maps every field', () {
      final model = buildLocationModel();

      final location = model.toLocation;

      expect(location.id, 3);
      expect(location.name, 'Citadel of Ricks');
      expect(location.type, 'Space station');
      expect(location.dimension, 'unknown');
      expect(location.residents, model.residents);
    });
  });

  group('OriginModel', () {
    test('fromJson and toOrigin map name and url', () {
      final model = OriginModel.fromJson({
        'name': 'Earth (C-137)',
        'url': 'https://rickandmortyapi.com/api/location/1',
      });

      expect(model.name, 'Earth (C-137)');
      expect(model.toOrigin, buildOrigin());
    });
  });

  group('BaseResponseModel', () {
    test('fromJson parses info and a generic results list', () {
      final model = BaseResponseModel<List<CharacterModel>>.fromJson(
        charactersResponseJson(),
        (json) => (json as List<dynamic>)
            .map(
              (item) => CharacterModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );

      expect(model.info?.count, 826);
      expect(model.results, hasLength(1));
      expect(model.results!.single.name, 'Rick Sanchez');
    });

    test('fromJson accepts null info and results', () {
      final model = BaseResponseModel<List<CharacterModel>>.fromJson({
        'info': null,
        'results': null,
      }, (json) => json as List<CharacterModel>);

      expect(model.info, isNull);
      expect(model.results, isNull);
    });

    test('toBaseResponse converts results and info', () {
      final model = buildCharactersResponseModel(info: buildInfoModel());

      final response = model.toBaseResponse(
        (characters) => characters.map((e) => e.toCharacter).toList(),
      );

      expect(response.info, buildInfo());
      expect(response.results, [buildCharacterModel().toCharacter]);
    });

    test('toBaseResponse keeps results null when the model has no results', () {
      final model = BaseResponseModel<List<CharacterModel>>(
        info: buildInfoModel(),
        results: null,
      );

      final response = model.toBaseResponse(
        (characters) => characters.map((e) => e.toCharacter).toList(),
      );

      expect(response.results, isNull);
    });
  });

  group('Entities equality', () {
    test('Character compares all fields', () {
      expect(buildCharacter(), buildCharacter());
      expect(buildCharacter(), isNot(buildCharacter(name: 'Morty Smith')));
    });

    test('Info, Location, Origin and BaseResponse have value equality', () {
      expect(buildInfo(), buildInfo());
      expect(buildLocation(), buildLocation());
      expect(buildOrigin(), buildOrigin());
      expect(buildCharactersResponse(), buildCharactersResponse());
      expect(
        const BaseResponse<Character>(results: null),
        const BaseResponse<Character>(results: null),
      );
    });
  });
}
