import 'dart:io';

import 'package:dio/dio.dart';
import 'package:clean_architecture_in_flutter/src/configs/injector/service_locator.dart';
import 'package:clean_architecture_in_flutter/src/core/errors/exceptions.dart';
import 'package:clean_architecture_in_flutter/src/core/utils/logger.dart';

abstract class ApiClient {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  });

  Future<Response<T>> upload<T>(
    String path, {
    required File file,
    String? fileName,
    String fieldName = 'file',
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  });

  void cancelRequests({CancelToken? cancelToken});
}

class ApiClientImpl implements ApiClient {
  final Dio _dio;
  final Logger _logger;
  final List<CancelToken> _cancelTokens = [];

  ApiClientImpl() : _dio = getIt<Dio>(), _logger = getIt<Logger>();

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: _mergeOptions(options),
        cancelToken: token,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mergeOptions(options),
        cancelToken: token,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mergeOptions(options),
        cancelToken: token,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mergeOptions(options),
        cancelToken: token,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mergeOptions(options),
        cancelToken: token,
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final response = await _dio.download(
        urlPath,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: token,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        onReceiveProgress: (received, total) {
          if (onReceiveProgress != null) {
            onReceiveProgress(received, total);
          }

          // Log download progress
          if (total != -1) {
            final progress = (received / total * 100).toStringAsFixed(0);
            _logger.debug('Download progress: $progress%');
          }
        },
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> upload<T>(
    String path, {
    required File file,
    String? fileName,
    String fieldName = 'file',
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final token = _getCancelToken(cancelToken);

      final formData = FormData.fromMap({
        ...?data,
        fieldName: await MultipartFile.fromFile(
          file.path,
          filename: fileName ?? file.path.split('/').last,
        ),
      });

      final response = await _dio.post<T>(
        path,
        data: formData,
        queryParameters: queryParameters,
        options: _mergeOptions(options, contentType: 'multipart/form-data'),
        cancelToken: token,
        onSendProgress: (sent, total) {
          if (onSendProgress != null) {
            onSendProgress(sent, total);
          }

          // Log upload progress
          if (total != -1) {
            final progress = (sent / total * 100).toStringAsFixed(0);
            _logger.debug('Upload progress: $progress%');
          }
        },
      );

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken != null) {
      cancelToken.cancel('Request cancelled by user');
    } else {
      // Cancel all pending requests
      for (final token in _cancelTokens) {
        if (!token.isCancelled) {
          token.cancel('All requests cancelled');
        }
      }
      _cancelTokens.clear();
    }
  }

  CancelToken _getCancelToken(CancelToken? cancelToken) {
    final token = cancelToken ?? CancelToken();
    if (cancelToken == null) {
      _cancelTokens.add(token);
    }
    return token;
  }

  Options _mergeOptions(Options? options, {String? contentType}) {
    return (options ?? Options()).copyWith(
      contentType: contentType ?? options?.contentType,
      headers: {...?options?.headers},
    );
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return TimeoutException(message: error.message ?? 'Request timeout');
        case DioExceptionType.connectionError:
          return const NoInternetException();
        case DioExceptionType.badResponse:
          return ServerException.fromDioError(error);
        case DioExceptionType.cancel:
          return const NetworkException(
            message: 'Request cancelled',
            code: 'CANCELLED',
          );
        default:
          return NetworkException(
            message: error.message ?? 'Network error occurred',
            code: 'NETWORK_ERROR',
          );
      }
    }
    return NetworkException(message: error.toString(), code: 'UNKNOWN_ERROR');
  }
}
