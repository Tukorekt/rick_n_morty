import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/presentation/common_widgets/character_card.dart';
import 'package:rick_n_morty/presentation/common_widgets/content_list.dart';

class CharactersListBody<
  S extends SuccessState<Character>,
  C extends BaseCubit<S>
>
    extends StatefulWidget {
  final C bloc;
  const CharactersListBody({super.key, required this.bloc});

  @override
  State<CharactersListBody> createState() => _CharactersListBodyState<S, C>();
}

class _CharactersListBodyState<
  S extends SuccessState<Character>,
  C extends BaseCubit<S>
>
    extends State<CharactersListBody<S, C>> {
  @override
  void initState() {
    super.initState();
    _loadValues();
  }

  void _loadValues() => widget.bloc.loadData();

  List<Character> _contentList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, BaseCubitState<S>>(
      bloc: widget.bloc,
      builder: (_, state) => _contentList.isNotEmpty
          ? ContentList(
              content: _contentList,
              load: () => _loadValues(),
              itemBuilder: (item) => CharacterCard(character: item),
            )
          : switch (state) {
              Loading() => Center(child: CircularProgressIndicator()),
              Failure() => Center(child: Text('Ошибка загрузки')),
              _ => Center(child: Text('Нет данных')),
            },
      listener: (_, state) {
        if (state is Success<S>) {
          setState(() {
            _contentList = state.state.contentList;
          });
        }
      },
    );
  }
}
