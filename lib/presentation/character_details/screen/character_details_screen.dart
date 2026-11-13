import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_icon_button.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_image.dart';
import 'package:rick_n_morty/presentation/common_widgets/status_chip.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

@RoutePage()
class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: padding4,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          character.name ?? '',
          style: context.appTheme.appBarTitleTextStyle,
        ),
        leading: AppIconButton(
          onTap: context.router.pop,
          icon: Icons.arrow_back,
          iconColor: context.appTheme.appBarIconsColor,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CharacterHero(character: character),
            Padding(
              padding: const EdgeInsets.all(padding16),
              child: _DetailsCard(character: character),
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterHero extends StatelessWidget {
  final Character character;

  const _CharacterHero({required this.character});

  @override
  Widget build(BuildContext context) {
    final image = character.image;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        padding16,
        padding16,
        padding16,
        padding24,
      ),
      decoration: BoxDecoration(
        color: context.appTheme.appBarColor,
        borderRadius: borderBottom32,
      ),
      child: Column(
        children: [
          if (image != null)
            _HeroImage(character: character, image: image)
          else
            const AppImagePlaceholder(
              size: defultImageSize,
              label: 'Нет изображения',
            ),
          const SizedBox(height: spacing16),
          StatusChip(status: character.status),
        ],
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final Character character;
  final String image;

  const _HeroImage({required this.character, required this.image});

  @override
  Widget build(BuildContext context) {
    final picture = AppImage(url: image, size: defultImageSize);
    if (character.id == null) return picture;

    return Hero(tag: 'character-image-${character.id}', child: picture);
  }
}

class _DetailsCard extends StatelessWidget {
  final Character character;

  const _DetailsCard({required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation,
      margin: EdgeInsets.zero,
      color: surfaceColor,
      shadowColor: accentColor.withValues(alpha: .16),
      shape: const RoundedRectangleBorder(borderRadius: border16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        child: Column(
          children: [
            _DetailRow(
              icon: Icons.favorite_border_rounded,
              text: 'Статус: ${character.status ?? ''}',
            ),
            const Divider(height: 1),
            _DetailRow(
              icon: Icons.eco_outlined,
              text: 'Вид: ${character.species ?? ''}',
            ),
            const Divider(height: 1),
            _DetailRow(
              icon: Icons.public_rounded,
              text: 'Происхождение: ${character.origin?.name ?? ''}',
            ),
            const Divider(height: 1),
            _DetailRow(
              icon: Icons.place_outlined,
              text: 'Текущая локация: ${character.location?.name ?? ''}',
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(padding8),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: .1),
              borderRadius: border8,
            ),
            child: Icon(icon, size: 18, color: accentColor),
          ),
          const SizedBox(width: spacing12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: primaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
