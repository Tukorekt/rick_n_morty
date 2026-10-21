import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/data/datasources/base_interfaces.dart';
import 'package:rick_n_morty/data/datasources/data_converter_mixin.dart';
import 'package:rick_n_morty/data/models/character/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ICharactersLocal
    implements BaseLocalInterface<CharacterModel>;

@LazySingleton(as: ICharactersLocal)
class CharactersLocalImpl with ConverterMixin implements ICharactersLocal {
  static const _key = 'cached_characters';

  final SharedPreferences prefs;

  const CharactersLocalImpl(this.prefs);

  @override
  Future<List<CharacterModel>> getCachedModels() async {
    final raw = prefs.getStringList(_key);

    if (raw == null) throw CacheException('No data', CharacterModel);

    try {
      return raw.map((e) => CharacterModel.fromJson(jsonDecode(e))).toList();
    } catch (_) {
      throw throw CacheException('Failed to convert', CharacterModel);
    }
  }

  @override
  Future<void> setCachedModels(List<CharacterModel> models) async {
    final list = models.map((e) => jsonEncode(e.toJson()));
    await prefs.setStringList(_key, list.toList());
  }
}
