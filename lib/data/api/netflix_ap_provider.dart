import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:netflix_clone/data/api/netflix_api.dart';
import 'package:dio/dio.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);
final netflixApiProvider = Provider<RestClient>((ref) {
  final dio = Dio();
  dio.interceptors.add(
    LogInterceptor(
      request: false,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (o) {
        if (kDebugMode) {
          logger.log(Level.info, o.toString());
        }
      },
    ),
  );

  return RestClient(dio);
});
