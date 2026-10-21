import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

abstract interface class ICharactersRepository {
  Future<BaseEntity<List<Character>>> getCharacters(int page);
  Future<BaseEntity<List<Character>>> searchCharacters((String, int) params);
}
