import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/constants.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/usecase/search_characters_use_case.dart';
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_state.dart';

@injectable
class SearchCharactersCubit extends BaseCubit<SearchCharactersState> {
  final SearchCharactersUseCase searchCharactersUseCase;

  String searchValue = '';

  SearchCharactersCubit(this.searchCharactersUseCase)
    : super(BaseCubitState.init());

  @override
  Future<void> loadData([bool reset = false]) async {
    if (state is Loading) return;

    if (searchValue.isEmpty) {
      return emit(
        BaseCubitState.success(state: SearchCharactersState(characters: [])),
      );
    }

    List<Character> loadedChars = [];
    if (state is Success<SearchCharactersState> && !reset) {
      loadedChars = (state as Success<SearchCharactersState>).state.characters;
    }

    emit(BaseCubitState.loading());

    final result = await searchCharactersUseCase((
      searchValue,
      loadedChars.length ~/ pageSize + 1,
    ));

    resolveBaseEntity(
      result,
      onException: (e) => emit(BaseCubitState.failure(exception: e)),
      onEntity: (e) => emit(
        BaseCubitState.success(
          state: SearchCharactersState(characters: [...loadedChars, ...e]),
        ),
      ),
    );
  }

  void updateSearchValue(String name) {
    searchValue = name;
    loadData(true);
  }
}
