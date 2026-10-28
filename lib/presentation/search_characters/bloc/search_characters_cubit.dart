import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/constants.dart';
import 'package:rick_n_morty/common/utils/string_utils.dart';
import 'package:rick_n_morty/domain/usecase/search_characters_use_case.dart';
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_state.dart';

@injectable
class SearchCharactersCubit extends BaseCubit<SearchCharactersState> {
  final SearchCharactersUseCase searchCharactersUseCase;

  SearchCharactersCubit(this.searchCharactersUseCase)
    : super(BaseCubitState.init());

  @override
  Future<void> loadData({String searchValue = '', bool reset = false}) async {
    if (state is Loading && !reset) return;

    if (searchValue.isEmpty) {
      return emit(
        BaseCubitState.success(
          state: SearchCharactersState(
            characters: [],
            searchValue: searchValue,
          ),
        ),
      );
    }

    emit(BaseCubitState.loading());

    SearchCharactersState? successState;
    if (state is Success<SearchCharactersState> && !reset) {
      successState = (state as Success<SearchCharactersState>).state;
    }

    final nextLastChar = successState?.info?.next.lastChar;
    final loadedChars = successState?.contentList;

    int loadedPage = 1;
    if (nextLastChar != null) {
      loadedPage = int.tryParse(nextLastChar) ?? loadedPage;
    } else if (loadedChars?.isNotEmpty == true) {
      loadedPage = loadedChars!.length ~/ pageSize + 1;
    }

    final result = await searchCharactersUseCase((searchValue, loadedPage));

    resolveBaseEntity(
      result,
      onException: (e) => emit(BaseCubitState.failure(exception: e)),
      onEntity: (e) => emit(
        BaseCubitState.success(
          state: SearchCharactersState(
            searchValue: searchValue,
            info: e.info,
            characters: [...?loadedChars, ...?e.results],
          ),
        ),
      ),
    );
  }

  void updateSearchValue(String name) =>
      loadData(searchValue: name, reset: true);

  void clearSearchValue() => loadData(reset: true);
}
