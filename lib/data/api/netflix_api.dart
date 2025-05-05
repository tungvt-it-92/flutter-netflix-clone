import 'package:dio/dio.dart';
import 'package:netflix_clone/data/entity/movie_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'netflix_api.g.dart';

@RestApi(baseUrl: 'https://netflix-mock-api.free.beeceptor.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/today-movies')
  Future<List<MovieEntity>> getTodayMovies();
}