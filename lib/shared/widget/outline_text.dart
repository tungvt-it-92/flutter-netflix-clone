import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double strokeWidth;
  final Color strokeColor;

  const OutlineText({
    required this.text,
    required this.style,
    this.strokeWidth = 2,
    this.strokeColor = Colors.white,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w700,
              foreground:
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth =strokeWidth
                ..color = strokeColor,
            ),
          ),
        ),

        Positioned.fill(
          child: Text(
            text,
            style: style
          ),
        )
      ],
    );
  }
}
