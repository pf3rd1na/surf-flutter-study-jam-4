import 'package:flutter/material.dart';

const kDefaultCircleGradientRadius = 0.0;

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.radius,
    required this.color,
  });

  double radius;
  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = RadialGradient(
      colors: [
        color,
        color.withOpacity(0),
      ],
      radius: radius,
    );
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Cirle extends StatelessWidget {
  const Cirle({
    super.key,
    required this.color,
    this.radius,
  });

  final Color color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        radius: radius ?? kDefaultCircleGradientRadius,
        color: color,
      ),
    );
  }
}
