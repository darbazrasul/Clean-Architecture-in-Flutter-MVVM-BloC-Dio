import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic data;
  final StackTrace? stackTrace;

  const AppException({
    required this.message,
    this.code,
    this.data,
    this.stackTrace,
  });

  @override
  String toString() =>
      'AppException: $message ${code != null ? '(Code: $code)' : ''}';
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class NoInternetException extends NetworkException {
  const NoInternetException()
    : super(message: 'No internet connection', code: 'NO_INTERNET');
}

class TimeoutException extends NetworkException {
  const TimeoutException({super.message = 'Request timeout'})
    : super(code: 'TIMEOUT');
}

class ServerException extends NetworkException {
  final int? statusCode;
  final String? statusMessage;

  const ServerException({
    required super.message,
    this.statusCode,
    this.statusMessage,
    super.code,
    super.data,
    super.stackTrace,
  });

  factory ServerException.fromDioError(DioException error) {
    final response = error.response;
    return ServerException(
      message: response?.data['message'] ?? error.message ?? 'Server error',
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
      code: response?.data['code']?.toString(),
      data: response?.data,
      stackTrace: error.stackTrace,
    );
  }
}

class ApiException extends NetworkException {
  final int? statusCode;
  final Map<String, dynamic>? errors;

  const ApiException({
    required super.message,
    this.statusCode,
    this.errors,
    super.code,
    super.data,
    super.stackTrace,
  });

  factory ApiException.fromResponse(Response response) {
    final data = response.data;
    return ApiException(
      message: data['message'] ?? 'API error',
      statusCode: response.statusCode,
      code: data['code']?.toString(),
      errors: data['errors'],
      data: data,
    );
  }
}

// Auth Exceptions
class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class UnauthorizedException extends AuthException {
  const UnauthorizedException({super.message = 'Unauthorized access'})
    : super(code: 'UNAUTHORIZED');
}

class ForbiddenException extends AuthException {
  const ForbiddenException({super.message = 'Access forbidden'})
    : super(code: 'FORBIDDEN');
}

class SessionExpiredException extends AuthException {
  const SessionExpiredException({
    super.message = 'Session expired. Please login again',
  }) : super(code: 'SESSION_EXPIRED');
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException({
    super.message = 'Invalid email or password',
  }) : super(code: 'INVALID_CREDENTIALS');
}

class AccountNotFoundException extends AuthException {
  const AccountNotFoundException({super.message = 'Account not found'})
    : super(code: 'ACCOUNT_NOT_FOUND');
}

class AccountDisabledException extends AuthException {
  const AccountDisabledException({super.message = 'Account has been disabled'})
    : super(code: 'ACCOUNT_DISABLED');
}

class EmailNotVerifiedException extends AuthException {
  const EmailNotVerifiedException({super.message = 'Email not verified'})
    : super(code: 'EMAIL_NOT_VERIFIED');
}

// Validation Exceptions
class ValidationException extends AppException {
  final Map<String, List<String>>? fieldErrors;

  const ValidationException({
    required super.message,
    this.fieldErrors,
    super.code,
    super.data,
    super.stackTrace,
  });

  String? getFieldError(String field) {
    return fieldErrors?[field]?.first;
  }

  List<String>? getFieldErrors(String field) {
    return fieldErrors?[field];
  }
}

class InvalidInputException extends ValidationException {
  const InvalidInputException({
    required super.message,
    super.fieldErrors,
    super.code,
    super.data,
  });
}

// Cache Exceptions
class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class CacheNotFoundException extends CacheException {
  const CacheNotFoundException({super.message = 'Cache not found'})
    : super(code: 'CACHE_NOT_FOUND');
}

class CacheExpiredException extends CacheException {
  const CacheExpiredException({super.message = 'Cache expired'})
    : super(code: 'CACHE_EXPIRED');
}

// Storage Exceptions
class StorageException extends AppException {
  const StorageException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class StoragePermissionException extends StorageException {
  const StoragePermissionException({
    super.message = 'Storage permission denied',
  }) : super(code: 'STORAGE_PERMISSION_DENIED');
}

class InsufficientStorageException extends StorageException {
  const InsufficientStorageException({
    super.message = 'Insufficient storage space',
  }) : super(code: 'INSUFFICIENT_STORAGE');
}

// Database Exceptions
class DatabaseException extends AppException {
  const DatabaseException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class RecordNotFoundException extends DatabaseException {
  const RecordNotFoundException({required String entity, String? id})
    : super(
        message: '$entity not found${id != null ? ' with id: $id' : ''}',
        code: 'RECORD_NOT_FOUND',
      );
}

class DuplicateRecordException extends DatabaseException {
  const DuplicateRecordException({required String entity, String? field})
    : super(
        message: 'Duplicate $entity${field != null ? ' with $field' : ''}',
        code: 'DUPLICATE_RECORD',
      );
}

// Business Logic Exceptions
class BusinessException extends AppException {
  const BusinessException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class InsufficientBalanceException extends BusinessException {
  const InsufficientBalanceException({super.message = 'Insufficient balance'})
    : super(code: 'INSUFFICIENT_BALANCE');
}

class ItemOutOfStockException extends BusinessException {
  const ItemOutOfStockException({super.message = 'Item is out of stock'})
    : super(code: 'OUT_OF_STOCK');
}

class OrderCancelledException extends BusinessException {
  const OrderCancelledException({super.message = 'Order has been cancelled'})
    : super(code: 'ORDER_CANCELLED');
}

class PaymentFailedException extends BusinessException {
  const PaymentFailedException({super.message = 'Payment failed'})
    : super(code: 'PAYMENT_FAILED');
}

// Feature Exceptions
class FeatureNotAvailableException extends AppException {
  const FeatureNotAvailableException({required String feature})
    : super(
        message: '$feature is not available',
        code: 'FEATURE_NOT_AVAILABLE',
      );
}

// Custom Platform Exception to avoid naming conflict
class AppPlatformException extends AppException {
  const AppPlatformException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

// Parse Exceptions
class ParseException extends AppException {
  const ParseException({
    required super.message,
    super.code,
    super.data,
    super.stackTrace,
  });
}

class JsonParseException extends ParseException {
  const JsonParseException({super.message = 'Failed to parse JSON', super.data})
    : super(code: 'JSON_PARSE_ERROR');
}
