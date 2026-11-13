import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/data/datasources/characters/characters_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/test_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SharedPreferences prefs;
  late CharactersLocalImpl local;

  Future<void> prepare(Map<String, Object> values) async {
    SharedPreferences.setMockInitialValues(values);
    prefs = await SharedPreferences.getInstance();
    local = CharactersLocalImpl(prefs);
  }

  group('CharactersLocalImpl', () {
    test('caches models and reads them back', () async {
      await prepare({});
      final models = [
        buildCharacterModel(id: 1, name: 'Rick Sanchez'),
        buildCharacterModel(id: 2, name: 'Morty Smith'),
      ];

      await local.setCachedModels(models);
      final cached = await local.getCachedModels();

      expect(cached, models);
      expect(prefs.getStringList('cached_characters'), hasLength(2));
    });

    test('does nothing when null models are passed', () async {
      await prepare({});

      await local.setCachedModels(null);

      expect(prefs.getStringList('cached_characters'), isNull);
    });

    test('throws CacheException when nothing was cached', () async {
      await prepare({});

      expect(local.getCachedModels(), throwsA(isA<CacheException>()));
    });

    test('throws CacheException when cached data is corrupted', () async {
      await prepare({
        'cached_characters': <String>['not a json'],
      });

      expect(local.getCachedModels(), throwsA(isA<CacheException>()));
    });

    test('overwrites previously cached models', () async {
      await prepare({});
      await local.setCachedModels([buildCharacterModel(id: 1)]);
      await local.setCachedModels([buildCharacterModel(id: 2, name: 'Morty')]);

      final cached = await local.getCachedModels();

      expect(cached, hasLength(1));
      expect(cached.single.name, 'Morty');
    });
  });
}
