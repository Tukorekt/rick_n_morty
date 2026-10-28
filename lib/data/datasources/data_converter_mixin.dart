import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/common/typedefs.dart';
import 'package:rick_n_morty/data/models/base_response/base_response_model.dart';

abstract interface class IConverterInterface<T> {
  BaseResponseModel<T> responseToModel(JSON json);
}

mixin ConverterMixin<T> implements IConverterInterface<T> {
  Future<BaseResponseModel<T>> handleResponse<D>(
    FutureOr<Response<D>> Function() request,
  ) async {
    try {
      final response = await request();

      if (response.statusCode == 200 && response.data != null) {
        return _tryToConvert(response.data as JSON);
      }

      throw InvalidDataException(response.statusCode, response.data);
    } on DioException catch (e) {
      throw HandledDioException(e.runtimeType);
    }
  }

  BaseResponseModel<T> _tryToConvert(JSON json) {
    try {
      return responseToModel(json);
    } catch (e) {
      throw ConvertionException(T);
    }
  }
}
