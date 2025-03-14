import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_clone/data/api/entity/movie_entity.dart';
import 'package:netflix_clone/feature/home/provider/today_movies_provider.dart';

import '../../../shared/widget/outline_text.dart';

class TopTodayMoviesView extends HookConsumerWidget {
  const TopTodayMoviesView({super.key});

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
            'Top 10 TV Shows in Japan Today',
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
                    ...value.asMap().entries.map<Widget>(
                      (a) => _MovieItem(movieEntity: a.value, index: a.key + 1),
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
  final int index;

  const _MovieItem({required this.movieEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    final rankView = Positioned.fill(
      child: OutlineText(
        text: '$index',
        style: TextStyle(
          fontSize: 100,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
    final bannerView = Positioned(
      top: 0,
      bottom: 0,
      left: 40,
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
      child: Text(
        'New Episode',
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );

    final watchNowActionView = Container(
      color: Colors.white,
      child: Text(
        'Watch Now',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    final titleView = Text(
      movieEntity.title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11),
    );
    return Container(
      width: 150,
      height: 160,
      color: Colors.black,
      child: Stack(
        children: [
          rankView,
          bannerView,
          Positioned(
            bottom: 0,
            left: 50,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  // titleView,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [newEpisodeView, watchNowActionView],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
