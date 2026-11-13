import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/utils/string_utils.dart';

void main() {
  group('StringNExtensions.lastChar', () {
    test('returns null for null', () {
      const String? value = null;

      expect(value.lastChar, isNull);
    });

    test('returns null for an empty string', () {
      expect(''.lastChar, isNull);
    });

    test('returns the only character of a one-character string', () {
      expect('7'.lastChar, '7');
    });

    test('returns the last character of a longer string', () {
      expect('/character/?page=12'.lastChar, '2');
    });

    test('works with non-ASCII characters', () {
      expect('Рик'.lastChar, 'к');
    });
  });
}
