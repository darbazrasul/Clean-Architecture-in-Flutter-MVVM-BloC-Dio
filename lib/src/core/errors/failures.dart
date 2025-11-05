import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

// Network Failures
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Server error occurred', super.code});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({super.message = 'No internet connection'})
    : super(code: 'NO_CONNECTION');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message = 'Request timeout'})
    : super(code: 'TIMEOUT');
}

// Auth Failures
class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.code});
}

class UnauthorizedFailure extends AuthFailure {
  const UnauthorizedFailure({super.message = 'Unauthorized'})
    : super(code: 'UNAUTHORIZED');
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure({super.message = 'Invalid credentials'})
    : super(code: 'INVALID_CREDENTIALS');
}

// Cache Failures
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error', super.code});
}

// Validation Failures
class ValidationFailure extends Failure {
  final Map<String, List<String>>? fieldErrors;

  const ValidationFailure({
    required super.message,
    this.fieldErrors,
    super.code,
  });

  @override
  List<Object?> get props => [message, code, fieldErrors];
}

// Business Logic Failures
class BusinessFailure extends Failure {
  const BusinessFailure({required super.message, super.code});
}

// Generic Failures
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message = 'An unexpected error occurred'})
    : super(code: 'UNEXPECTED');
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Unknown error'})
    : super(code: 'UNKNOWN');
}

// Feature Failures
class FeatureFailure extends Failure {
  const FeatureFailure({required super.message, super.code});
}

class NotImplementedFailure extends FeatureFailure {
  const NotImplementedFailure({super.message = 'Feature not implemented'})
    : super(code: 'NOT_IMPLEMENTED');
}

// Platform Failures
class PlatformFailure extends Failure {
  const PlatformFailure({required super.message, super.code});
}
