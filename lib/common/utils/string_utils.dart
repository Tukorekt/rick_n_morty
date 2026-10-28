extension StringNExtensions on String? {
  String? get lastChar =>
      this?.isNotEmpty == true ? this![this!.length - 1] : null;
}

abstract final class StringUtils {}
