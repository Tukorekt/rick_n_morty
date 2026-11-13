import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/usecase/get_characters_use_case.dart';
import 'package:rick_n_morty/domain/usecase/search_characters_use_case.dart';

import '../../helpers/test_data.dart';

void main() {
  late FakeCharactersRepository repository;

  setUp(() => repository = FakeCharactersRepository());

  group('GetCharactersUseCase', () {
    test(
      'delegates the page to the repository and returns its result',
      () async {
        final expected = buildSuccessEntity(results: [buildCharacter()]);
        repository.onGetCharacters = (_) async => expected;
        final useCase = GetCharactersUseCase(charactersRepository: repository);

        final result = await useCase(5);

        expect(repository.requestedPages, [5]);
        expect(result, expected);
      },
    );

    test('propagates a failure entity', () async {
      final expected = buildFailureEntity(CacheException('No data', Character));
      repository.onGetCharacters = (_) async => expected;
      final useCase = GetCharactersUseCase(charactersRepository: repository);

      final result = await useCase(1);

      expect(result.exception, same(expected.exception));
      expect(result.entity, isNull);
    });
  });

  group('SearchCharactersUseCase', () {
    test('delegates name and page to the repository', () async {
      final expected = buildSuccessEntity(results: [buildCharacter()]);
      repository.onSearchCharacters = (params) async {
        expect(params, ('rick', 2));
        return expected;
      };
      final useCase = SearchCharactersUseCase(charactersRepository: repository);

      final result = await useCase(('rick', 2));

      expect(repository.searchRequests, [('rick', 2)]);
      expect(result, expected);
    });
  });
}
