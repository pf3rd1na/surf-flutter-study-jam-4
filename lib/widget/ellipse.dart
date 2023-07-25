import 'package:flutter/material.dart';

// WARNING. THIS CODE DOESNT WORK PROPERLY. DONT HAVE TIME TO FINISH AND NOT USING IT IN PROJECT.
// Main idea is to build ellipse runtime using CustomPainter instead of using image from Figma.
// Linear gradient works fine, but radial gradient is not working properly.
// You can watch [Circle] widget in [magic_ball_screen.dart] to see how Circle works.

enum GradientType { radial, linear }

class EllipsePainterLinear extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size, {Color? color}) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = LinearGradient(
      colors: [
        const Color(0xFF01FFFF),
        const Color(0xFF01FFFF).withOpacity(0),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class EllipsePainterRadial extends CustomPainter {
  EllipsePainterRadial(
    this.opacity,
    this.opacity2, {
    required this.color,
    required this.color2,
  });

  final Color color;
  final Color color2;
  final double? opacity;
  final double? opacity2;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = RadialGradient(
      colors: [
        color.withOpacity(opacity ?? 1),
        color2.withOpacity(opacity2 ?? 0),
      ],
      center: Alignment.center,
      focal: Alignment.center,
      radius: 3,
      focalRadius: 0.3,
    );
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Ellipse extends StatelessWidget {
  const Ellipse({
    Key? key,
    required this.width,
    required this.height,
    required this.gradientType,
    required this.firstColor,
    required this.secondColor,
  }) : super(key: key);

  final double width;
  final double height;
  final GradientType gradientType;
  final Color firstColor;
  final Color secondColor;

  CustomPainter _getPainter() {
    switch (gradientType) {
      case GradientType.linear:
        return EllipsePainterLinear();
      case GradientType.radial:
        return EllipsePainterRadial(
          0.5,
          0.0,
          color: firstColor,
          color2: secondColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _getPainter(),
      ),
    );
  }
}
