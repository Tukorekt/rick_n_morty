import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';

typedef Json = Map<String, dynamic>;

abstract interface class IConverter {
  T convert<T>(T Function(Json json) converter, Json json);
}

mixin ConverterMixin implements IConverter {
  @override
  T convert<T>(T Function(Json json) converter, Json json) {
    try {
      return converter(json);
    } catch (e) {
      throw ConvertionException(T);
    }
  }
}

mixin BaseResponseMixin on IConverter {
  Future<T> handleResponse<T, D>(
    FutureOr<Response<D>> Function() request,
    T Function(Json json) converter,
  ) async {
    try {
      final response = await request();

      if (response.statusCode == 200 && response.data != null) {
        return await convert(converter, response.data! as Json);
      }

      throw InvalidDataException(response.statusCode, response.data);
    } on DioException catch (e) {
      throw HandledDioException(e.runtimeType);
    }
  }
}
