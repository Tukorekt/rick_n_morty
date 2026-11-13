import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

void main() {
  group('AppException.fromException', () {
    test('returns the same instance for an AppException', () {
      final exception = ConvertionException(Character);

      expect(AppException.fromException(exception), same(exception));
    });

    test('wraps any other exception into UnexpecredExeption', () {
      final error = Exception('boom');

      final result = AppException.fromException(error);

      expect(result, isA<UnexpecredExeption>());
      expect(result.message, contains('boom'));
    });
  });

  group('AppException messages', () {
    test('ConvertionException mentions the target type', () {
      expect(
        ConvertionException(Character).message,
        'Convertion error, type: Character',
      );
    });

    test('InvalidDataException mentions the status code and payload', () {
      final exception = InvalidDataException(404, {'error': 'Not found'});

      expect(exception.message, contains('code: 404'));
      expect(exception.message, contains('Not found'));
    });

    test('HandledDioException mentions the Dio error type', () {
      expect(
        HandledDioException(DioExceptionStub).message,
        contains('DioExceptionStub'),
      );
    });

    test('CacheException mentions the message and the type', () {
      expect(
        CacheException('No data', Character).message,
        'No data, type: Character',
      );
    });

    test('UnexpecredExeption mentions the original exception', () {
      expect(
        UnexpecredExeption(Exception('something')).message,
        contains('something'),
      );
    });
  });
}

// A lightweight stand-in for a Dio exception runtime type.
class DioExceptionStub {}
