import 'package:flutter/material.dart';
import '../../../shared/widget/outline_text.dart';

class TopTodayMoviesView extends StatelessWidget {
  const TopTodayMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...[
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                    'assets/images/the_lord_of_the_ring_thumbnail.jpg',
                  ].asMap().entries.map<Widget>(
                    (a) => _MovieItem(assetBanner: a.value, index: a.key + 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieItem extends StatelessWidget {
  final String assetBanner;
  final int index;

  const _MovieItem({required this.assetBanner, required this.index, super.key});

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
        child: Image.asset(assetBanner, fit: BoxFit.cover),
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
      'The Lords of The Rings',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
      ),
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
                  titleView,
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
