import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';
import 'package:rick_n_morty/common/usecase/use_case.dart';

@injectable
class SearchCharactersUseCase
    implements UseCase<List<Character>, (String, int)> {
  final ICharactersRepository charactersRepository;

  const SearchCharactersUseCase({required this.charactersRepository});

  @override
  Future<BaseEntity<List<Character>>> call((String, int) params) =>
      charactersRepository.searchCharacters(params);
}
