import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

part 'search_characters_state.freezed.dart';

@freezed
abstract class SearchCharactersState
    with _$SearchCharactersState
    implements SuccessState<Character> {
  const SearchCharactersState._();

  factory SearchCharactersState({
    @Default(<Character>[]) List<Character> characters,
  }) = _SearchCharactersState;

  @override
  List<Character> get contentList => characters;
}
