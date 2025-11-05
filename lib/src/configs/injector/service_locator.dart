import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:clean_architecture_in_flutter/src/core/api/api_url.dart';
import 'package:clean_architecture_in_flutter/src/core/network/dio_factory.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() async {
  getIt.registerSingleton<Dio>(
    DioFactory.dio(baseUrl: ApiUrl.baseUrl, enableLogging: !kReleaseMode),
  );
}
