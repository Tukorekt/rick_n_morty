import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/constants.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/domain/usecase/get_characters_use_case.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_state.dart';

@injectable
class CharactersListCubit extends BaseCubit<CharactersListState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharactersListCubit(this.getCharactersUseCase) : super(BaseCubitState.init());

  @override
  Future<void> loadData() async {
    if (state is Loading) return;

    List<Character> loadedChars = [];
    if (state is Success<CharactersListState>) {
      loadedChars = (state as Success<CharactersListState>).state.characters;
    }

    emit(BaseCubitState.loading());

    final result = await getCharactersUseCase(
      loadedChars.length ~/ pageSize + 1,
    );

    resolveBaseEntity(
      result,
      onException: (e) => emit(BaseCubitState.failure(exception: e)),
      onEntity: (e) => emit(
        BaseCubitState.success(
          state: CharactersListState(characters: [...loadedChars, ...e]),
        ),
      ),
    );
  }
}
