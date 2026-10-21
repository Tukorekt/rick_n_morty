import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

part 'characters_list_state.freezed.dart';

@freezed
abstract class CharactersListState
    with _$CharactersListState
    implements SuccessState<Character> {
  const CharactersListState._();

  factory CharactersListState({
    @Default(<Character>[]) List<Character> characters,
  }) = _CharactersListState;

  @override
  List<Character> get contentList => characters;
}
