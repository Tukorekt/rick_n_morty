import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/data/repositories/characters_repository_impl.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

import '../../helpers/test_data.dart';

void main() {
  late FakeCharactersApi api;
  late FakeCharactersLocal local;
  late FakeNetworkInfo networkInfo;
  late CharactersRepositoryImpl repository;

  setUp(() {
    api = FakeCharactersApi();
    local = FakeCharactersLocal();
    networkInfo = FakeNetworkInfo();
    repository = CharactersRepositoryImpl(
      charactersApiImpl: api,
      charactersLocalImpl: local,
      networkInfo: networkInfo,
    );
  });

  group('CharactersRepositoryImpl.getCharacters', () {
    test('loads from the API and caches the result when online', () async {
      final model = buildCharacterModel();
      api.onGetCharacters = (_) async => buildCharactersResponseModel(
        results: [model],
        info: buildInfoModel(next: '/character/?page=2'),
      );

      final result = await repository.getCharacters(1);

      expect(result.exception, isNull);
      expect(result.entity?.results, [model.toCharacter]);
      expect(result.entity?.info?.next, '/character/?page=2');
      expect(api.requestedPages, [1]);
      expect(local.saved, [
        [model],
      ]);
    });

    test('falls back to the cache when offline', () async {
      networkInfo.connected = false;
      final cached = buildCharacterModel(id: 7, name: 'Morty Smith');
      local.models = [cached];

      final result = await repository.getCharacters(3);

      expect(api.requestedPages, isEmpty);
      expect(result.exception, isNull);
      expect(result.entity?.results, [cached.toCharacter]);
      expect(result.entity?.info, isNull);
    });

    test('returns a CacheException when offline without a cache', () async {
      networkInfo.connected = false;

      final result = await repository.getCharacters(1);

      expect(result.entity, isNull);
      expect(result.exception, isA<CacheException>());
      expect(api.requestedPages, isEmpty);
    });

    test('returns an AppException from the API as-is', () async {
      final exception = ConvertionException(Character);
      api.onGetCharacters = (_) async => throw exception;

      final result = await repository.getCharacters(1);

      expect(result.exception, same(exception));
      expect(local.saved, isEmpty);
    });

    test('wraps unexpected exceptions into UnexpecredExeption', () async {
      api.onGetCharacters = (_) async => throw Exception('boom');

      final result = await repository.getCharacters(1);

      expect(result.exception, isA<UnexpecredExeption>());
    });

    test('ignores the cache while online', () async {
      local.models = [buildCharacterModel(id: 99, name: 'Cached')];

      final result = await repository.getCharacters(1);

      expect(result.entity?.results?.single.name, 'Rick Sanchez');
      expect(local.saved, isNotEmpty);
    });
  });

  group('CharactersRepositoryImpl.searchCharacters', () {
    test('passes the query and page to the API', () async {
      final model = buildCharacterModel(id: 2, name: 'Morty Smith');
      api.onSearchCharacters = (params) async {
        expect(params, ('Morty', 4));
        return buildCharactersResponseModel(results: [model]);
      };

      final result = await repository.searchCharacters(('Morty', 4));

      expect(api.searchRequests, [('Morty', 4)]);
      expect(result.entity?.results, [model.toCharacter]);
      expect(result.exception, isNull);
    });

    test(
      'returns an empty entity when offline without a local fallback',
      () async {
        networkInfo.connected = false;

        final result = await repository.searchCharacters(('Rick', 1));

        expect(result.entity, isNull);
        expect(result.exception, isNull);
        expect(api.searchRequests, isEmpty);
      },
    );

    test('wraps errors into UnexpecredExeption', () async {
      api.onSearchCharacters = (_) async => throw Exception('network');

      final result = await repository.searchCharacters(('Rick', 1));

      expect(result.exception, isA<UnexpecredExeption>());
    });
  });

  group('CharactersRepositoryImpl.convertToEntity', () {
    test('converts model info and characters into a domain entity', () {
      final model = buildCharactersResponseModel(
        results: [buildCharacterModel()],
        info: buildInfoModel(next: '/character/?page=2'),
      );

      final entity = repository.convertToEntity(model);

      expect(entity.entity?.info?.next, '/character/?page=2');
      expect(entity.entity?.results, [buildCharacterModel().toCharacter]);
    });
  });
}
