import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_theme.g.theme.dart';

@ThemeExtensions()
class AppTheme extends ThemeExtension<AppTheme> with _$AppTheme {
  final Color appBarColor;
  final TextStyle appBarTitleTextStyle;
  final Color appBarIconsColor;

  const AppTheme({
    required this.appBarColor,
    required this.appBarTitleTextStyle,
    required this.appBarIconsColor,
  });
}
