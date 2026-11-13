import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/routing/router.gr.dart';
import 'package:rick_n_morty/domain/entities/character.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_image.dart';
import 'package:rick_n_morty/presentation/common_widgets/status_chip.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: cardElevation,
      margin: EdgeInsets.zero,
      color: surfaceColor,
      clipBehavior: Clip.antiAlias,
      shadowColor: accentColor.withValues(alpha: .18),
      shape: const RoundedRectangleBorder(borderRadius: border16),
      child: InkWell(
        onTap: () =>
            context.router.push(CharacterDetailsRoute(character: character)),
        child: Padding(
          padding: const EdgeInsets.all(padding8),
          child: Row(
            children: [
              _CharacterThumbnail(character: character),
              const SizedBox(width: padding16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: spacing8),
                    StatusChip(status: character.status),
                    if ((character.species ?? '').trim().isNotEmpty) ...[
                      const SizedBox(height: spacing8),
                      _MetaRow(
                        icon: Icons.eco_outlined,
                        text: character.species!,
                      ),
                    ],
                    if ((character.gender ?? '').trim().isNotEmpty) ...[
                      const SizedBox(height: spacing4),
                      _MetaRow(icon: Icons.wc_rounded, text: character.gender!),
                    ],
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: secondaryTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterThumbnail extends StatelessWidget {
  final Character character;

  const _CharacterThumbnail({required this.character});

  @override
  Widget build(BuildContext context) {
    final image = character.image;
    if (image == null) {
      return const AppImagePlaceholder(size: miniImageSize);
    }

    final picture = AppImage(url: image, size: miniImageSize);
    if (character.id == null) return picture;

    return Hero(tag: 'character-image-${character.id}', child: picture);
  }
}

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: secondaryTextColor),
        const SizedBox(width: spacing4),
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: secondaryTextColor, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
