import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/constants.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';
import 'package:rick_n_morty/domain/usecase/get_characters_use_case.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_cubit.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_state.dart';

import '../helpers/test_data.dart';

CharactersListState _successState(CharactersListCubit cubit) {
  final state = cubit.state;
  expect(state, isA<Success<CharactersListState>>());
  return (state as Success<CharactersListState>).state;
}

void main() {
  late FakeCharactersRepository repository;
  late CharactersListCubit cubit;

  setUp(() {
    repository = FakeCharactersRepository();
    cubit = CharactersListCubit(
      GetCharactersUseCase(charactersRepository: repository),
    );
  });

  tearDown(() => cubit.close());

  test('starts in the Init state', () {
    expect(cubit.state, isA<Init<CharactersListState>>());
  });

  group('loadData', () {
    test('requests the first page and emits the characters', () async {
      final characters = [
        buildCharacter(),
        buildCharacter(id: 2, name: 'Morty'),
      ];
      repository.onGetCharacters = (_) async => buildSuccessEntity(
        results: characters,
        info: buildInfo(next: '/character/?page=2'),
      );

      await cubit.loadData();

      final state = _successState(cubit);
      expect(repository.requestedPages, [1]);
      expect(state.characters, characters);
      expect(state.info?.next, '/character/?page=2');
      expect(state.contentList, characters);
    });

    test('loads the next page using the page number from info.next', () async {
      repository.onGetCharacters = (page) async => buildSuccessEntity(
        results: [buildCharacter(id: page, name: 'Character $page')],
        info: buildInfo(next: '/character/?page=${page + 1}'),
      );

      await cubit.loadData();
      await cubit.loadData();

      final state = _successState(cubit);
      expect(repository.requestedPages, [1, 2]);
      expect(state.characters, hasLength(2));
      expect(state.characters.last.name, 'Character 2');
    });

    test(
      'computes the next page from the loaded list when info is missing',
      () async {
        repository.onGetCharacters = (page) async => buildSuccessEntity(
          results: List.generate(
            pageSize,
            (index) => buildCharacter(id: index, name: 'Character $index'),
          ),
        );

        await cubit.loadData();
        await cubit.loadData();

        expect(repository.requestedPages, [1, 2]);
        expect(_successState(cubit).characters, hasLength(pageSize * 2));
      },
    );

    test('emits Loading before the request completes', () async {
      final completer = Completer<BaseEntity<CharactersResponse>>();
      repository.onGetCharacters = (_) => completer.future;

      final request = cubit.loadData();
      expect(cubit.state, isA<Loading<CharactersListState>>());

      completer.complete(buildSuccessEntity());
      await request;

      expect(cubit.state, isA<Success<CharactersListState>>());
    });

    test('ignores loadData calls while a request is in flight', () async {
      final completer = Completer<BaseEntity<CharactersResponse>>();
      repository.onGetCharacters = (_) => completer.future;

      final request = cubit.loadData();
      await cubit.loadData();

      expect(repository.requestedPages, [1]);

      completer.complete(buildSuccessEntity());
      await request;
    });

    test('emits Failure with the returned exception', () async {
      final exception = CacheException('No data', Character);
      repository.onGetCharacters = (_) async => buildFailureEntity(exception);

      await cubit.loadData();

      final state = cubit.state;
      expect(state, isA<Failure<CharactersListState>>());
      expect(
        (state as Failure<CharactersListState>).exception,
        same(exception),
      );
    });
  });
}
