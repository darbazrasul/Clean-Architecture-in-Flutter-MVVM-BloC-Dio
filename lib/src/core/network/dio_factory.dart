import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioFactory {
  DioFactory._();

  static Dio dio({required String baseUrl, bool enableLogging = false}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': 'dG5Z',
        },
        followRedirects: true,
        validateStatus: (status) => status! < 500,
      ),
    );

    if (enableLogging) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      );
    }

    return dio;
  }
}


//===========================
// The SSL Error
//===========================
    // if (!kReleaseMode) {
    // Allow self-signed certificates in debug mode
    // (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    //   final client = HttpClient();
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    // }