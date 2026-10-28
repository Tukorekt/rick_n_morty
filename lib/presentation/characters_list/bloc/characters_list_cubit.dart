import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/constants.dart';
import 'package:rick_n_morty/common/utils/string_utils.dart';
import 'package:rick_n_morty/domain/usecase/get_characters_use_case.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_state.dart';

@injectable
class CharactersListCubit extends BaseCubit<CharactersListState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharactersListCubit(this.getCharactersUseCase) : super(BaseCubitState.init());

  @override
  Future<void> loadData() async {
    if (state is Loading) return;

    emit(BaseCubitState.loading());

    CharactersListState? successState;
    if (state is Success<CharactersListState>) {
      successState = (state as Success<CharactersListState>).state;
    }

    final nextLastChar = successState?.info?.next.lastChar;
    final loadedChars = successState?.contentList;

    int loadedPage = 1;
    if (nextLastChar != null) {
      loadedPage = int.tryParse(nextLastChar) ?? loadedPage;
    } else if (loadedChars?.isNotEmpty == true) {
      loadedPage = loadedChars!.length ~/ pageSize + 1;
    }

    final result = await getCharactersUseCase(loadedPage);

    resolveBaseEntity(
      result,
      onException: (e) => emit(BaseCubitState.failure(exception: e)),
      onEntity: (e) => emit(
        BaseCubitState.success(
          state: CharactersListState(
            info: e.info,
            characters: [...?loadedChars, ...?e.results],
          ),
        ),
      ),
    );
  }
}
