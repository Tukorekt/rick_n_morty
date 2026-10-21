import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/di/injector.dart';
import 'package:rick_n_morty/presentation/characters_list/bloc/characters_list_cubit.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_bar_with_search.dart';
import 'package:rick_n_morty/presentation/common_widgets/characters_list_body.dart';
import 'package:rick_n_morty/presentation/search_characters/bloc/search_characters_cubit.dart';

@NamedRoute('characters')
class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  bool _isSearchPerformed = false;
  final _listBloc = getIt.get<CharactersListCubit>();
  final _searchBloc = getIt.get<SearchCharactersCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearch(
        onSearchTap: (isOpened) => setState(() {
          _isSearchPerformed = isOpened;
        }),
        isSearchperformed: _isSearchPerformed,
        onSearch: (String? value) {
          if (value == null) return;
          _searchBloc.updateSearchValue(value);
        },
      ),
      body: _isSearchPerformed
          ? CharactersListBody(
              key: GlobalObjectKey('search_bloc'),
              bloc: _searchBloc,
            )
          : CharactersListBody(
              key: GlobalObjectKey('list_bloc'),
              bloc: _listBloc,
            ),
    );
  }
}
