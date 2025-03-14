import 'package:dio/dio.dart';
import 'package:netflix_clone/data/api/entity/movie_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'netflix_api.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/38b954cd-63e2-42f0-9ec0-49cc7ef1256f')
  Future<List<MovieEntity>> getTodayMovies();
}