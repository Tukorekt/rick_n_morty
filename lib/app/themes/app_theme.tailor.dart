// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeTailorMixin on ThemeExtension<AppTheme> {
  Color get appBarColor;
  TextStyle get appBarTitleTextStyle;
  Color get appBarIconsColor;

  @override
  AppTheme copyWith({
    Color? appBarColor,
    TextStyle? appBarTitleTextStyle,
    Color? appBarIconsColor,
  }) {
    return AppTheme(
      appBarColor: appBarColor ?? this.appBarColor,
      appBarTitleTextStyle: appBarTitleTextStyle ?? this.appBarTitleTextStyle,
      appBarIconsColor: appBarIconsColor ?? this.appBarIconsColor,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      appBarTitleTextStyle: TextStyle.lerp(
        appBarTitleTextStyle,
        other.appBarTitleTextStyle,
        t,
      )!,
      appBarIconsColor: Color.lerp(
        appBarIconsColor,
        other.appBarIconsColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality().equals(
              appBarColor,
              other.appBarColor,
            ) &&
            const DeepCollectionEquality().equals(
              appBarTitleTextStyle,
              other.appBarTitleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              appBarIconsColor,
              other.appBarIconsColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(appBarColor),
      const DeepCollectionEquality().hash(appBarTitleTextStyle),
      const DeepCollectionEquality().hash(appBarIconsColor),
    );
  }
}

extension AppThemeBuildContextProps on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  Color get appBarColor => appTheme.appBarColor;
  TextStyle get appBarTitleTextStyle => appTheme.appBarTitleTextStyle;
  Color get appBarIconsColor => appTheme.appBarIconsColor;
}
