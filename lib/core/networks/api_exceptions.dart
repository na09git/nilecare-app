class ApiExceptions implements Exception {
  final String message;
  final int? statusCode;
  ApiExceptions(this.message, {this.statusCode});

  @override
  String toString() => 'ApiExceptions: $message';
}

class BadRequestException extends ApiExceptions {
  BadRequestException(super.message) : super(statusCode: 400);
}

class UnauthorizedException extends ApiExceptions {
  UnauthorizedException(super.message) : super(statusCode: 401);
}

class ForbiddenException extends ApiExceptions {
  ForbiddenException(super.message) : super(statusCode: 403);
}

class NotFoundException extends ApiExceptions {
  NotFoundException(super.message) : super(statusCode: 404);
}

class ServerException extends ApiExceptions {
  ServerException(super.message) : super(statusCode: 500);
}

class NetwrokException extends ApiExceptions {
  NetwrokException(super.message);
}
