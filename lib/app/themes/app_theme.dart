import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  @override
  final Color appBarColor;
  @override
  final TextStyle appBarTitleTextStyle;
  @override
  final Color appBarIconsColor;

  const AppTheme({
    required this.appBarColor,
    required this.appBarTitleTextStyle,
    required this.appBarIconsColor,
  });
}
