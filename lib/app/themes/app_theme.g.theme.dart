// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$AppTheme on ThemeExtension<AppTheme> {
  @override
  ThemeExtension<AppTheme> copyWith({
    Color? appBarColor,
    TextStyle? appBarTitleTextStyle,
    Color? appBarIconsColor,
  }) {
    final _this = (this as AppTheme);

    return AppTheme(
      appBarColor: appBarColor ?? _this.appBarColor,
      appBarTitleTextStyle: appBarTitleTextStyle ?? _this.appBarTitleTextStyle,
      appBarIconsColor: appBarIconsColor ?? _this.appBarIconsColor,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    final _this = (this as AppTheme);

    return AppTheme(
      appBarColor: Color.lerp(_this.appBarColor, other.appBarColor, t)!,
      appBarTitleTextStyle: TextStyle.lerp(
        _this.appBarTitleTextStyle,
        other.appBarTitleTextStyle,
        t,
      )!,
      appBarIconsColor: Color.lerp(
        _this.appBarIconsColor,
        other.appBarIconsColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as AppTheme);
    final _other = (other as AppTheme);

    return _other.appBarColor == _this.appBarColor &&
        _other.appBarTitleTextStyle == _this.appBarTitleTextStyle &&
        _other.appBarIconsColor == _this.appBarIconsColor;
  }

  @override
  int get hashCode {
    final _this = (this as AppTheme);

    return Object.hash(
      runtimeType,
      _this.appBarColor,
      _this.appBarTitleTextStyle,
      _this.appBarIconsColor,
    );
  }
}

extension AppThemeBuildContext on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
