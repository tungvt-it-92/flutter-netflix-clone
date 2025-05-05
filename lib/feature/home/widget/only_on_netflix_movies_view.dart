import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_clone/data/entity/movie_entity.dart';
import 'package:netflix_clone/feature/home/provider/today_movies_provider.dart';

class OnlyOnNetflixMoviesView extends HookConsumerWidget {
  const OnlyOnNetflixMoviesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MovieEntity>> movies = ref.watch(
      topTodayMoviesProvider,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          child: Text(
            'Only on Netflix',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.black,
              child: switch (movies) {
                AsyncData(:final value) => Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...value.map<Widget>(
                          (movie) => _MovieItem(movieEntity: movie),
                    ),
                  ],
                ),
                AsyncError() => const Text(
                  'Oops, something unexpected happened',
                ),
                _ => Container(),
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieItem extends StatelessWidget {
  final MovieEntity movieEntity;

  const _MovieItem({required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    final bannerView = Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: movieEntity.bannerUrl,
          cacheKey: movieEntity.bannerUrl,
          fit: BoxFit.cover,
          placeholder:
              (context, url) => Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white,),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );

    final newEpisodeView = Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Text(
          'New Episode',
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final watchNowActionView = Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Text(
          'Watch Now',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    return Container(
      width: 150,
      height: 250,
      color: Colors.black,
      child: Stack(
        children: [
          bannerView,
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newEpisodeView,
                  watchNowActionView,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
