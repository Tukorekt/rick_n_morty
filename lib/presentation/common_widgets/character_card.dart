import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/routing/router.gr.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_image.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.router.push(CharacterDetailsRoute(character: character)),
      child: Card(
        elevation: cardElevation,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsetsGeometry.all(padding8),
          child: Column(
            spacing: 4,
            children: [
              if (character.image != null)
                AppImage(url: character.image!, size: miniImageSize),
              Text(
                character.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(character.status ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
