import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_clone/data/api/netflix_ap_provider.dart';
import 'package:netflix_clone/data/entity/movie_entity.dart';

final topTodayMoviesProvider = FutureProvider<List<MovieEntity>>((ref) async {
  final httpClient = ref.read(netflixApiProvider);
  final res = await httpClient.getTodayMovies();
  return res;
});