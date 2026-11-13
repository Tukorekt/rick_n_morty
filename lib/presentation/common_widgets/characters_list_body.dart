import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/presentation/common_widgets/character_card.dart';
import 'package:rick_n_morty/presentation/common_widgets/content_list.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class CharactersListBody<
  S extends SuccessState<Character>,
  C extends BaseCubit<S>
>
    extends StatefulWidget {
  final C bloc;
  const CharactersListBody({super.key, required this.bloc});

  @override
  State<CharactersListBody<S, C>> createState() =>
      _CharactersListBodyState<S, C>();
}

class _CharactersListBodyState<
  S extends SuccessState<Character>,
  C extends BaseCubit<S>
>
    extends State<CharactersListBody<S, C>> {
  List<Character> _contentList = [];

  @override
  void initState() {
    super.initState();
    _loadValues();
  }

  @override
  void didUpdateWidget(covariant CharactersListBody<S, C> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.bloc == widget.bloc) return;

    final state = widget.bloc.state;
    _contentList = state is Success<S> ? state.state.contentList : [];

    if (state is Init) _loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, BaseCubitState<S>>(
      bloc: widget.bloc,
      builder: (_, state) => _contentList.isNotEmpty
          ? ContentList(
              content: _contentList,
              load: () => _loadValues(),
              padding: const EdgeInsets.fromLTRB(
                padding16,
                padding8,
                padding16,
                spacing24,
              ),
              itemBuilder: (item) => Padding(
                padding: const EdgeInsets.only(bottom: spacing8),
                child: CharacterCard(character: item),
              ),
            )
          : switch (state) {
              Loading() => const _LoadingView(),
              Failure() => const _StateView(
                icon: Icons.cloud_off_rounded,
                title: 'Ошибка загрузки',
                subtitle: 'Проверьте соединение и попробуйте снова',
              ),
              _ => const _StateView(
                icon: Icons.search_off_rounded,
                title: 'Нет данных',
                subtitle: 'Попробуйте изменить запрос',
              ),
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

  void _loadValues() => widget.bloc.loadData();
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: accentColor),
          SizedBox(height: spacing16),
          Text(
            'Загружаем персонажей…',
            style: TextStyle(color: secondaryTextColor),
          ),
        ],
      ),
    );
  }
}

class _StateView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _StateView({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(padding16),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: .1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: accentColor),
            ),
            const SizedBox(height: spacing16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
