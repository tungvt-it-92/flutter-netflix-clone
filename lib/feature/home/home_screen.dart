import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:netflix_clone/feature/home/widget/gradient_background_view.dart';
import 'package:netflix_clone/feature/home/widget/home_header_view.dart';
import 'package:netflix_clone/feature/home/widget/top_movie_view.dart';

import 'widget/top_today_movies_view.dart';

final double actionViewHeight = 45;
final double categoryViewHeight = 60;

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.padding.top;
    final scrollController = useScrollController();
    final isCategoryPresented = useState(true);
    final isBlurBackgroundPresented = useState(false);

    void scrollListener() {
      final offset = scrollController.offset;
      isBlurBackgroundPresented.value = offset > 30;
      if ((offset - scrollController.initialScrollOffset).abs() >= 40) {
        isCategoryPresented.value =
            scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      }
    }

    useEffect(() {
      scrollController.addListener(scrollListener);
      return () => scrollController.removeListener(scrollListener);
    }, [],);

    return Stack(
      children: <Widget>[
        GradientBackgroundView(),
        SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.only(
            top: topPadding + actionViewHeight + categoryViewHeight + 20,
          ),
          child: Column(
            children: [
              TopMovieView(height: mediaQuery.size.height * 0.6),
              Align(
                alignment: Alignment.centerLeft,
                child: TopTodayMoviesView(),
              ),
              ...List.generate(200, (index) {
                return Center(child: Text('Move item $index'));
              }),
            ],
          ),
        ),
        HomeHeaderView(
          isCategoryPresented: isCategoryPresented.value,
          isBlurBackgroundPresented: isBlurBackgroundPresented.value,
        ),
      ],
    );
  }
}
