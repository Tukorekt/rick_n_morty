import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/base_response.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

typedef CharactersResponse = BaseResponse<List<Character>>;

abstract interface class ICharactersRepository {
  Future<BaseEntity<CharactersResponse>> getCharacters(int page);
  Future<BaseEntity<CharactersResponse>> searchCharacters((String, int) params);
}
