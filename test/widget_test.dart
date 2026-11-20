import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/app/app.dart';
import 'package:rick_n_morty/app/di/injector.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';
import 'package:rick_n_morty/domain/usecase/get_characters_use_case.dart';
import 'package:rick_n_morty/domain/usecase/search_characters_use_case.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_cubit.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_state.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_bar_with_search.dart';
import 'package:rick_n_morty/presentation/common_widgets/character_card.dart';
import 'package:rick_n_morty/presentation/common_widgets/characters_list_body.dart';
import 'package:rick_n_morty/presentation/common_widgets/content_list.dart';
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_cubit.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'helpers/test_data.dart';

const _testTheme = AppTheme(
  appBarColor: Colors.deepPurple,
  appBarTitleTextStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  appBarIconsColor: Colors.white,
);

Widget _app(Widget child) => MaterialApp(
  theme: ThemeData(extensions: const [_testTheme]),
  home: child,
);

void main() {
  setUp(() {
    // VisibilityDetector schedules a timer on every paint. Disable it so widget
    // tests don't fail with pending timers; visibility callbacks still run.
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  group('CharacterCard', () {
    testWidgets('shows the character name and status', (tester) async {
      await tester.pumpWidget(
        _app(
          Scaffold(
            body: CharacterCard(
              character: buildCharacter(name: 'Rick Sanchez'),
            ),
          ),
        ),
      );

      expect(find.text('Rick Sanchez'), findsOneWidget);
      expect(find.text('Alive'), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('renders empty strings for missing fields', (tester) async {
      await tester.pumpWidget(
        _app(Scaffold(body: CharacterCard(character: const Character()))),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text(''), findsNWidgets(2));
    });
  });

  group('AppBarWithSearch', () {
    testWidgets('shows the title and reports the search tap', (tester) async {
      bool? searchOpened;

      await tester.pumpWidget(
        _app(
          Scaffold(
            appBar: AppBarWithSearch(
              isSearchperformed: false,
              onSearchTap: (isOpened) => searchOpened = isOpened,
              onSearch: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Список персонажей'), findsOneWidget);
      expect(find.byType(TextField), findsNothing);

      await tester.tap(find.byIcon(Icons.search));

      expect(searchOpened, isTrue);
    });

    testWidgets('shows a text field and forwards typed text in search mode', (
      tester,
    ) async {
      String? searchedValue;
      bool? searchOpened;

      await tester.pumpWidget(
        _app(
          Scaffold(
            appBar: AppBarWithSearch(
              isSearchperformed: true,
              onSearchTap: (isOpened) => searchOpened = isOpened,
              onSearch: (value) => searchedValue = value,
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Список персонажей'), findsNothing);

      await tester.enterText(find.byType(TextField), 'Rick');
      expect(searchedValue, 'Rick');

      await tester.tap(find.byIcon(Icons.close));
      expect(searchOpened, isFalse);
    });
  });

  group('Navigation to CharacterDetailsScreen', () {
    late FakeCharactersRepository repository;

    setUp(() {
      getIt.reset();
      repository = FakeCharactersRepository();
      getIt.registerFactory<CharactersListCubit>(
        () => CharactersListCubit(
          GetCharactersUseCase(charactersRepository: repository),
        ),
      );
      getIt.registerFactory<SearchCharactersCubit>(
        () => SearchCharactersCubit(
          SearchCharactersUseCase(charactersRepository: repository),
        ),
      );
    });

    tearDown(() => getIt.reset());

    testWidgets('opens the details and returns back to the list', (
      tester,
    ) async {
      repository.onGetCharacters = (_) async =>
          buildSuccessEntity(results: [buildCharacter(name: 'Rick Sanchez')]);

      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.text('Rick Sanchez'), findsOneWidget);

      await tester.tap(find.text('Rick Sanchez'));
      await tester.pumpAndSettle();

      expect(find.text('Статус: Alive'), findsOneWidget);
      expect(find.text('Вид: Human'), findsOneWidget);
      expect(find.text('Происхождение: Earth (C-137)'), findsOneWidget);
      expect(find.text('Текущая локация: Citadel of Ricks'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.text('Список персонажей'), findsOneWidget);
      expect(find.text('Rick Sanchez'), findsOneWidget);
    });

    testWidgets('shows placeholders for missing fields', (tester) async {
      repository.onGetCharacters = (_) async =>
          buildSuccessEntity(results: [const Character()]);

      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CharacterCard));
      await tester.pumpAndSettle();

      expect(find.text('Статус: '), findsOneWidget);
      expect(find.text('Вид: '), findsOneWidget);
      expect(find.text('Происхождение: '), findsOneWidget);
      expect(find.text('Текущая локация: '), findsOneWidget);
    });
  });

  group('ContentList', () {
    testWidgets('builds every item with the provided builder', (tester) async {
      await tester.pumpWidget(
        _app(
          Scaffold(
            body: ContentList<String>(
              content: const ['Rick', 'Morty', 'Summer'],
              load: () {},
              itemBuilder: (item) => Text(item),
            ),
          ),
        ),
      );

      expect(find.text('Rick'), findsOneWidget);
      expect(find.text('Morty'), findsOneWidget);
      expect(find.text('Summer'), findsOneWidget);
    });
  });

  group('CharactersListBody', () {
    late FakeCharactersRepository repository;
    late CharactersListCubit cubit;

    setUp(() {
      repository = FakeCharactersRepository();
      cubit = CharactersListCubit(
        GetCharactersUseCase(charactersRepository: repository),
      );
    });

    tearDown(() => cubit.close());

    Future<void> pumpBody(WidgetTester tester) => tester.pumpWidget(
      _app(
        Scaffold(
          body: CharactersListBody<CharactersListState, CharactersListCubit>(
            bloc: cubit,
          ),
        ),
      ),
    );

    testWidgets('shows a loader while characters are loading', (tester) async {
      final completer = Completer<BaseEntity<CharactersResponse>>();
      repository.onGetCharacters = (_) => completer.future;

      await pumpBody(tester);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      completer.complete(
        buildSuccessEntity(results: [buildCharacter(name: 'Rick Sanchez')]),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('shows characters after a successful load', (tester) async {
      repository.onGetCharacters = (_) async =>
          buildSuccessEntity(results: [buildCharacter(name: 'Rick Sanchez')]);

      await pumpBody(tester);
      await tester.pumpAndSettle();

      expect(find.text('Rick Sanchez'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows an error message on failure', (tester) async {
      repository.onGetCharacters = (_) async =>
          buildFailureEntity(CacheException('No data', Character));

      await pumpBody(tester);
      await tester.pumpAndSettle();

      expect(find.text('Ошибка загрузки'), findsOneWidget);
    });

    testWidgets('shows a no-data message for an empty result', (tester) async {
      repository.onGetCharacters = (_) async => buildSuccessEntity(results: []);

      await pumpBody(tester);
      await tester.pumpAndSettle();

      expect(find.text('Нет данных'), findsOneWidget);
    });
  });
}
