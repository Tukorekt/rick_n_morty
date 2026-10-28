sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);

  static AppException fromException(Exception e) =>
      e is AppException ? e : UnexpecredExeption(e);
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

class UnexpecredExeption extends AppException {
  UnexpecredExeption(Exception e) : super('Unexpected exeption: $e');
}
