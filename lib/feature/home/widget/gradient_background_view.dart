import 'package:flutter/material.dart';

class GradientBackgroundView extends StatelessWidget {
  const GradientBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF4A1E1E),
              Colors.black,
            ],
        ),
      ),
    );
  }
}