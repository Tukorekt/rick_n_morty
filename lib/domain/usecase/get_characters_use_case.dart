import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/interfaces/characters_repository.dart';
import 'package:rick_n_morty/common/usecase/use_case.dart';

@injectable
class GetCharactersUseCase implements UseCase<List<Character>, int> {
  final ICharactersRepository charactersRepository;

  const GetCharactersUseCase({required this.charactersRepository});

  @override
  Future<BaseEntity<List<Character>>> call(int page) =>
      charactersRepository.getCharacters(page);
}
