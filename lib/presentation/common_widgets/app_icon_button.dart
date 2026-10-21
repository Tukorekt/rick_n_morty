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
    return InkWell(
      onTap: onTap,
      borderRadius: border16,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(padding4),
        child: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
