import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/common/typedefs.dart';
import 'package:rick_n_morty/data/datasources/data_converter_mixin.dart';
import 'package:rick_n_morty/data/models/base_response/base_response_model.dart';

class _IntListConverter
    with ConverterMixin<List<int>>
    implements IConverterInterface<List<int>> {
  @override
  BaseResponseModel<List<int>> responseToModel(JSON json) =>
      BaseResponseModel<List<int>>.fromJson(
        json,
        (results) => (results as List<dynamic>).cast<int>(),
      );
}

Response<dynamic> _response({int statusCode = 200, dynamic data}) =>
    Response<dynamic>(
      requestOptions: RequestOptions(path: '/character/'),
      statusCode: statusCode,
      data: data,
    );

Map<String, dynamic> get _validJson => {
  'info': {'count': 2, 'pages': 1, 'next': null, 'prev': null},
  'results': [1, 2],
};

void main() {
  late _IntListConverter converter;

  setUp(() => converter = _IntListConverter());

  group('ConverterMixin.handleResponse', () {
    test('returns a converted model for a successful response', () async {
      final model = await converter.handleResponse(
        () => _response(data: _validJson),
      );

      expect(model.info?.count, 2);
      expect(model.results, [1, 2]);
    });

    test('accepts a FutureOr request callback', () async {
      final model = await converter.handleResponse(
        () async => _response(data: _validJson),
      );

      expect(model.results, [1, 2]);
    });

    test('throws InvalidDataException for a non-200 status code', () async {
      expect(
        () => converter.handleResponse(
          () => _response(statusCode: 404, data: {'error': 'Not found'}),
        ),
        throwsA(
          isA<InvalidDataException>().having(
            (e) => e.message,
            'message',
            contains('code: 404'),
          ),
        ),
      );
    });

    test('throws InvalidDataException when the body is null', () async {
      expect(
        () => converter.handleResponse(() => _response(data: null)),
        throwsA(isA<InvalidDataException>()),
      );
    });

    test('throws HandledDioException when Dio fails', () async {
      expect(
        () => converter.handleResponse(
          () => throw DioException(
            requestOptions: RequestOptions(path: '/character/'),
            type: DioExceptionType.connectionTimeout,
          ),
        ),
        throwsA(isA<HandledDioException>()),
      );
    });

    test(
      'throws ConvertionException when the payload cannot be parsed',
      () async {
        expect(
          () => converter.handleResponse(
            () => _response(data: {'info': null, 'results': 'not-a-list'}),
          ),
          throwsA(
            isA<ConvertionException>().having(
              (e) => e.message,
              'message',
              contains('List<int>'),
            ),
          ),
        );
      },
    );
  });
}
