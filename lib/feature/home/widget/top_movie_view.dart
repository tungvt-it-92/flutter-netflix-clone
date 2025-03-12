import 'package:flutter/material.dart';

class TopMovieView extends StatelessWidget {
  final double height;

  const TopMovieView({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            _MovieBanner(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _NetflixSeriesView(),
                  SizedBox(height: 5),
                  _MovieTitle(),
                  SizedBox(height: 15),
                  _MovieCategories(),
                  SizedBox(height: 10),
                  _ActionViews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionViews extends StatelessWidget {
  const _ActionViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _generateActionButton(label: 'Play', icon: Icons.play_arrow),
          _generateActionButton(
            label: 'My List',
            icon: Icons.add,
            iconColor: Colors.white,
            labelColor: Colors.white,
            backgroundColor: Colors.white.withValues(alpha: 0.4),
          ),
        ],
      ),
    );
  }

  Widget _generateActionButton({
    required String label,
    required IconData icon,
    Color labelColor = Colors.black,
    Color iconColor = Colors.black,
    Color backgroundColor = Colors.white,
  }) {
    return Expanded(
      child: TextButton.icon(
        onPressed: () {},
        label: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: labelColor,
          ),
        ),
        icon: Icon(icon, color: iconColor, size: 30),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _MovieCategories extends StatelessWidget {
  static final _textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  const _MovieCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Text('Emotional', style: _textStyle),
        _generatePoint(),
        Text('Bittersweet', style: _textStyle),
        _generatePoint(),
        Text('Comedy', style: _textStyle),
      ],
    );
  }

  Widget _generatePoint() {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Money Heist',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }
}

class _MovieBanner extends StatelessWidget {
  const _MovieBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 13.5,
      child: Image.asset(
        'assets/images/money_heist_banner.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _NetflixSeriesView extends StatelessWidget {
  const _NetflixSeriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2,
      children: [
        Image.asset('assets/images/netflix_logo.png', width: 20, height: 20),
        Text(
          'SERIES',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
