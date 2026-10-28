import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/entities/info.dart';

part 'search_characters_state.freezed.dart';

@freezed
abstract class SearchCharactersState extends SuccessState<Character>
    with _$SearchCharactersState {
  const SearchCharactersState._();

  factory SearchCharactersState({
    @Default(<Character>[]) List<Character> characters,
    Info? info,
    @Default('') String searchValue,
  }) = _SearchCharactersState;

  @override
  List<Character> get contentList => characters;
}
