import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';
import 'package:rick_n_morty/domain/usecase/search_characters_use_case.dart';
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_cubit.dart';
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_state.dart';

import '../helpers/test_data.dart';

SearchCharactersState _successState(SearchCharactersCubit cubit) {
  final state = cubit.state;
  expect(state, isA<Success<SearchCharactersState>>());
  return (state as Success<SearchCharactersState>).state;
}

void main() {
  late FakeCharactersRepository repository;
  late SearchCharactersCubit cubit;

  setUp(() {
    repository = FakeCharactersRepository();
    cubit = SearchCharactersCubit(
      SearchCharactersUseCase(charactersRepository: repository),
    );
  });

  tearDown(() => cubit.close());

  test('starts in the Init state', () {
    expect(cubit.state, isA<Init<SearchCharactersState>>());
  });

  group('loadData', () {
    test(
      'emits an empty result and skips the request for an empty query',
      () async {
        await cubit.loadData();

        final state = _successState(cubit);
        expect(repository.searchRequests, isEmpty);
        expect(state.characters, isEmpty);
        expect(state.searchValue, '');
      },
    );

    test('searches using the query and the first page', () async {
      repository.onSearchCharacters = (params) async => buildSuccessEntity(
        results: [buildCharacter(name: params.$1)],
        info: buildInfo(next: '/character/?page=2'),
      );

      await cubit.loadData(searchValue: 'Rick');

      final state = _successState(cubit);
      expect(repository.searchRequests, [('Rick', 1)]);
      expect(state.searchValue, 'Rick');
      expect(state.characters.single.name, 'Rick');
    });

    test('loads the next page using info.next', () async {
      repository.onSearchCharacters = (params) async => buildSuccessEntity(
        results: [
          buildCharacter(id: params.$2, name: '${params.$1} ${params.$2}'),
        ],
        info: buildInfo(next: '/character/?page=${params.$2 + 1}'),
      );

      await cubit.loadData(searchValue: 'Rick');
      await cubit.loadData(searchValue: 'Rick');

      final state = _successState(cubit);
      expect(repository.searchRequests, [('Rick', 1), ('Rick', 2)]);
      expect(state.characters, hasLength(2));
      expect(state.characters.last.name, 'Rick 2');
    });

    test('emits Loading while the request is running', () async {
      final completer = Completer<BaseEntity<CharactersResponse>>();
      repository.onSearchCharacters = (_) => completer.future;

      final request = cubit.loadData(searchValue: 'Rick');
      expect(cubit.state, isA<Loading<SearchCharactersState>>());

      completer.complete(buildSuccessEntity());
      await request;

      expect(cubit.state, isA<Success<SearchCharactersState>>());
    });

    test('ignores a non-reset call while a request is in flight', () async {
      final completer = Completer<BaseEntity<CharactersResponse>>();
      repository.onSearchCharacters = (_) => completer.future;

      final request = cubit.loadData(searchValue: 'Rick');
      await cubit.loadData(searchValue: 'Morty');

      expect(repository.searchRequests, [('Rick', 1)]);

      completer.complete(buildSuccessEntity());
      await request;
    });

    test('a reset call is not blocked while a request is in flight', () async {
      final completers = <Completer<BaseEntity<CharactersResponse>>>[];
      repository.onSearchCharacters = (_) {
        final completer = Completer<BaseEntity<CharactersResponse>>();
        completers.add(completer);
        return completer.future;
      };

      final first = cubit.loadData(searchValue: 'Rick');
      final second = cubit.loadData(searchValue: 'Morty', reset: true);

      expect(repository.searchRequests, [('Rick', 1), ('Morty', 1)]);

      for (final completer in completers) {
        completer.complete(buildSuccessEntity());
      }
      await Future.wait([first, second]);
    });

    test('emits Failure with the returned exception', () async {
      final exception = ConvertionException(Character);
      repository.onSearchCharacters = (_) async =>
          buildFailureEntity(exception);

      await cubit.loadData(searchValue: 'Rick');

      final state = cubit.state;
      expect(state, isA<Failure<SearchCharactersState>>());
      expect(
        (state as Failure<SearchCharactersState>).exception,
        same(exception),
      );
    });
  });

  group('updateSearchValue', () {
    test('resets the previous results and searches the first page', () async {
      repository.onSearchCharacters = (params) async => buildSuccessEntity(
        results: [buildCharacter(id: params.$2, name: params.$1)],
        info: buildInfo(next: '/character/?page=2'),
      );

      await cubit.loadData(searchValue: 'Rick');
      cubit.updateSearchValue('Morty');
      await pumpEventQueue();

      final state = _successState(cubit);
      expect(repository.searchRequests, [('Rick', 1), ('Morty', 1)]);
      expect(state.searchValue, 'Morty');
      expect(state.characters, hasLength(1));
      expect(state.characters.single.name, 'Morty');
    });
  });

  group('clearSearchValue', () {
    test('resets the state without an API request', () async {
      repository.onSearchCharacters = (_) async =>
          buildSuccessEntity(results: [buildCharacter()]);

      await cubit.loadData(searchValue: 'Rick');
      cubit.clearSearchValue();
      await pumpEventQueue();

      final state = _successState(cubit);
      expect(repository.searchRequests, [('Rick', 1)]);
      expect(state.characters, isEmpty);
      expect(state.searchValue, '');
    });
  });
}
