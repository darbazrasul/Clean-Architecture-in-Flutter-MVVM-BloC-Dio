// import 'dart:async';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:esim/core/di/service_locator.dart';
// import 'package:flutter/services.dart' as flutter_services;
// import 'exceptions.dart';
// import 'failures.dart';
// import '../extensions/utils/logger.dart';

// class ErrorHandler {
//   static final Logger _logger = getIt<Logger>();

//   // Convert Exception to Failure
//   static Failure handleException(dynamic error, [StackTrace? stackTrace]) {
//     _logger.e('Error occurred', error, stackTrace);

//     if (error is AppException) {
//       return _handleAppException(error);
//     } else if (error is DioException) {
//       return _handleDioError(error);
//     } else if (error is flutter_services.PlatformException) {
//       return _handlePlatformException(error);
//     } else if (error is SocketException) {
//       return const ConnectionFailure();
//     } else if (error is TimeoutException) {
//       return const TimeoutFailure();
//     } else if (error is FormatException) {
//       return ValidationFailure(
//         message: 'Invalid format: ${error.message}',
//         code: 'FORMAT_ERROR',
//       );
//     } else {
//       return UnexpectedFailure(message: error.toString());
//     }
//   }

//   // Handle AppException
//   static Failure _handleAppException(AppException exception) {
//     switch (exception.runtimeType) {
//       case NoInternetException _:
//         return const ConnectionFailure();
//       case TimeoutException _:
//         return const TimeoutFailure();
//       case ServerException _:
//         return ServerFailure(message: exception.message, code: exception.code);
//       case UnauthorizedException _:
//         return const UnauthorizedFailure();
//       case InvalidCredentialsException _:
//         return const InvalidCredentialsFailure();
//       case ValidationException _:
//         return ValidationFailure(
//           message: exception.message,
//           code: exception.code,
//           fieldErrors: (exception as ValidationException).fieldErrors,
//         );
//       case BusinessException _:
//         return BusinessFailure(
//           message: exception.message,
//           code: exception.code,
//         );
//       default:
//         return UnexpectedFailure(message: exception.message);
//     }
//   }

//   // Handle Dio errors
//   static Failure _handleDioError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return const TimeoutFailure();
//       case DioExceptionType.connectionError:
//         return const ConnectionFailure();
//       case DioExceptionType.badResponse:
//         return _handleResponseError(error.response);
//       case DioExceptionType.cancel:
//         return const NetworkFailure(
//           message: 'Request cancelled',
//           code: 'REQUEST_CANCELLED',
//         );
//       default:
//         return NetworkFailure(
//           message: error.message ?? 'Network error',
//           code: 'NETWORK_ERROR',
//         );
//     }
//   }

//   // Handle response errors
//   static Failure _handleResponseError(Response? response) {
//     if (response == null) {
//       return const ServerFailure();
//     }

//     final statusCode = response.statusCode ?? 0;
//     final data = response.data;
//     final message = _extractErrorMessage(data);

//     switch (statusCode) {
//       case 400:
//         return ValidationFailure(
//           message: message ?? 'Bad request',
//           code: 'BAD_REQUEST',
//           fieldErrors: _extractFieldErrors(data),
//         );
//       case 401:
//         return UnauthorizedFailure(message: message ?? 'Unauthorized');
//       case 403:
//         return AuthFailure(message: message ?? 'Forbidden', code: 'FORBIDDEN');
//       case 404:
//         return NetworkFailure(
//           message: message ?? 'Not found',
//           code: 'NOT_FOUND',
//         );
//       case 422:
//         return ValidationFailure(
//           message: message ?? 'Validation error',
//           code: 'VALIDATION_ERROR',
//           fieldErrors: _extractFieldErrors(data),
//         );
//       case 429:
//         return NetworkFailure(
//           message: message ?? 'Too many requests',
//           code: 'TOO_MANY_REQUESTS',
//         );
//       case 500:
//       case 502:
//       case 503:
//       case 504:
//         return ServerFailure(
//           message: message ?? 'Server error',
//           code: statusCode.toString(),
//         );
//       default:
//         return NetworkFailure(
//           message: message ?? 'Network error',
//           code: statusCode.toString(),
//         );
//     }
//   }

//   // Handle platform exceptions
//   static Failure _handlePlatformException(
//     flutter_services.PlatformException error,
//   ) {
//     return PlatformFailure(
//       message: error.message ?? 'Platform error',
//       code: error.code,
//     );
//   }

//   // Extract error message from response
//   static String? _extractErrorMessage(dynamic data) {
//     if (data is Map<String, dynamic>) {
//       return data['message'] ?? data['error'] ?? data['errors'];
//     } else if (data is String) {
//       return data;
//     }
//     return null;
//   }

//   // Extract field errors from response
//   static Map<String, List<String>>? _extractFieldErrors(dynamic data) {
//     if (data is Map<String, dynamic>) {
//       final errors = data['errors'] ?? data['fieldErrors'];
//       if (errors is Map<String, dynamic>) {
//         return errors.map((key, value) {
//           if (value is List) {
//             return MapEntry(key, value.cast<String>());
//           } else if (value is String) {
//             return MapEntry(key, [value]);
//           }
//           return MapEntry(key, [value.toString()]);
//         });
//       }
//     }
//     return null;
//   }

//   // Global error handler for uncaught errors
//   static void handleError(Object error, StackTrace stackTrace) {
//     _logger.e('Uncaught error', error, stackTrace);

//     // Report to crash analytics (e.g., Firebase Crashlytics)
//     // FirebaseCrashlytics.instance.recordError(error, stackTrace);
//   }

//   // Run with error handling
//   static Future<T> runWithErrorHandling<T>(
//     Future<T> Function() operation, {
//     T Function(Failure)? onError,
//   }) async {
//     try {
//       return await operation();
//     } catch (error, stackTrace) {
//       final failure = handleException(error, stackTrace);
//       if (onError != null) {
//         return onError(failure);
//       }
//       throw failure;
//     }
//   }

//   // Run sync with error handling
//   static T runSyncWithErrorHandling<T>(
//     T Function() operation, {
//     T Function(Failure)? onError,
//   }) {
//     try {
//       return operation();
//     } catch (error, stackTrace) {
//       final failure = handleException(error, stackTrace);
//       if (onError != null) {
//         return onError(failure);
//       }
//       throw failure;
//     }
//   }
// }

// // Extension for easy error handling
// extension FutureErrorHandling<T> on Future<T> {
//   Future<T> handleError({T Function(Failure)? onError}) {
//     return ErrorHandler.runWithErrorHandling(() => this, onError: onError);
//   }
// }
