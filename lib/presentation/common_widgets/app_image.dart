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
        placeholder: (_, _) => Container(
          width: size,
          height: size,
          color: Colors.grey,
          child: Center(
            child: Text('Изображения нет', textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
