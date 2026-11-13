import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double size;

  const AppImage({super.key, required this.url, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: border16,
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 200),
        placeholder: (_, _) => AppImagePlaceholder(size: size),
        errorWidget: (_, _, _) =>
            AppImagePlaceholder(size: size, icon: Icons.broken_image_outlined),
      ),
    );
  }
}

class AppImagePlaceholder extends StatelessWidget {
  final double size;
  final IconData icon;
  final String? label;

  const AppImagePlaceholder({
    super.key,
    required this.size,
    this.icon = Icons.image_not_supported_outlined,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        borderRadius: border16,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEDEBFF), Color(0xFFE2DEFF)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: size * .28, color: const Color(0xFF9C93D9)),
          if (label != null) ...[
            const SizedBox(height: spacing4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing8),
              child: Text(
                label!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: secondaryTextColor, fontSize: 11),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
