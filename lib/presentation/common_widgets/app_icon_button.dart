import 'package:flutter/material.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;

  const AppIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(padding8),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(icon, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}
