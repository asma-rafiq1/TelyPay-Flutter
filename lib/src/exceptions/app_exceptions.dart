class AppException implements Exception {
  String message;
  String? prefix;
  String? url;
  AppException({required this.message, this.url, this.prefix});

  @override
  String toString() => '$prefix: $message';
}

class BadRequestException extends AppException {
  BadRequestException({required String message, String? url})
      : super(prefix: 'Bad Request', message: message, url: url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required String message, String? url})
      : super(message: message, url: url, prefix: 'UnAuthorized Request');
}

class NetworkErrorException extends AppException {
  NetworkErrorException({required String message, String? url})
      : super(
          prefix: 'Network Error',
          message: message,
          url: url,
        );
}

class DownTimeException extends AppException {
  DownTimeException({required String message, String? url})
      : super(
          prefix: 'TimeOut',
          message: message,
          url: url,
        );
}

class InternalServerException extends AppException {
  InternalServerException({required String message, String? url})
      : super(
          prefix: 'Error:',
          message: message,
          url: url,
        );
}
