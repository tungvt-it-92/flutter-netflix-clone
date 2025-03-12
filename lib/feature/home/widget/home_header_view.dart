import 'dart:ui';

import 'package:flutter/material.dart';

import '../home_screen.dart';

class HomeHeaderView extends StatelessWidget {
  final bool isCategoryPresented;
  final bool isBlurBackgroundPresented;

  const HomeHeaderView({
    required this.isCategoryPresented,
    required this.isBlurBackgroundPresented,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
        isBlurBackgroundPresented
            ? _BlurBackgroundView(
              height:
                  isCategoryPresented
                      ? (topPadding + actionViewHeight + categoryViewHeight)
                      : (topPadding + actionViewHeight),
            )
            : SizedBox(),
        Padding(
          padding: EdgeInsets.fromLTRB(15, topPadding, 15, 10),
          child: Column(
            children: [
              _QuickActionView(height: actionViewHeight),
              _CategoriesView(
                presented: isCategoryPresented,
                height: categoryViewHeight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BlurBackgroundView extends StatelessWidget {
  final double height;

  const _BlurBackgroundView({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: height,
          child: Container(color: Colors.grey.withValues(alpha: 0.2)),
        ),
      ),
    );
  }
}

class _QuickActionView extends StatelessWidget {
  final double height;

  const _QuickActionView({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Row(
          children: [
            Text(
              'For Tung',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.cast, size: 25)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.download_outlined, size: 25),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoriesView extends StatefulWidget {
  final bool presented;
  final double height;

  const _CategoriesView({
    required this.presented,
    required this.height,
    super.key,
  });

  @override
  State<_CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<_CategoriesView> {
  static const _labelStyle = TextStyle(color: Colors.white);
  static const _borderStyle = BorderSide(color: Colors.white, width: 1);
  static const _animationDuration = Duration(milliseconds: 200);

  Widget _generateButton({
    required VoidCallback onPressed,
    required String buttonName,
    Size minimumSize = const Size(40, 40),
    Icon? icon,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: _borderStyle,
        minimumSize: minimumSize,
      ),
      label: Text(buttonName, style: _labelStyle),
      icon: icon,
      iconAlignment: IconAlignment.end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: AnimatedOpacity(
        opacity: widget.presented ? 1 : 0,
        duration: _animationDuration,
        child: AnimatedSlide(
          offset: Offset(0, widget.presented ? 0 : -1),
          duration: _animationDuration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: <Widget>[
              _generateButton(onPressed: () {}, buttonName: 'TV Shows'),
              _generateButton(onPressed: () {}, buttonName: 'Movies'),
              _generateButton(
                onPressed: () {},
                buttonName: 'Categories',
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}