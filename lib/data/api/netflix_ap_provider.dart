import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:netflix_clone/data/api/netflix_api.dart';
import 'package:dio/dio.dart';

final logger = Logger();
final netflixApiProvider = Provider<RestClient>((ref) {
  return RestClient(Dio());
});
