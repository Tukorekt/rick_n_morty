import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_icon_button.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_image.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

@RoutePage()
class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appTheme.appBarColor,
        titleSpacing: padding4,
        automaticallyImplyLeading: false,
        title: Text(
          character.name ?? '',
          style: context.appTheme.appBarTitleTextStyle,
        ),
        centerTitle: true,
        leading: AppIconButton(
          onTap: context.router.pop,
          icon: Icons.arrow_back,
          iconColor: context.appTheme.appBarIconsColor,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(padding16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              spacing: spacing16,
              children: [
                if (character.image != null)
                  AppImage(url: character.image!, size: defultImageSize),
                Text('Статус: ${character.status ?? ''}'),
                Text('Вид: ${character.species ?? ''}'),
                Text('Происхождение: ${character.origin?.name ?? ''}'),
                Text('Текущая локация: ${character.location?.name ?? ''}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
