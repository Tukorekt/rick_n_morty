sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

class ConvertionException extends AppException {
  ConvertionException(Type type) : super('Convertion error, type: $type');
}

class InvalidDataException extends AppException {
  InvalidDataException(int? statusCode, dynamic data)
    : super('InvalidDataException, code: $statusCode, data: $data');
}

class HandledDioException extends AppException {
  HandledDioException(Type type) : super('Handled dio exception, type: $type');
}

class CacheException extends AppException {
  CacheException(String message, Type type) : super('$message, type: $type');
}
