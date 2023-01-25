import 'package:flutter/material.dart';

class HolePainter extends CustomPainter {
  final Color color;
  final double radius;
  final double circleDifference;
  final int numberOfCircles;

  const HolePainter({
    required this.color,
    required this.radius,
    required this.circleDifference,
    required this.numberOfCircles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    var startingPath = Path()
      ..addRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    for (var i = 0; i < numberOfCircles; ++i) {
      final path = Path()
        ..addOval(
          Rect.fromCircle(
            center: center,
            radius: radius - (i * 100),
          ),
        )
        ..close();

      canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          startingPath,
          path,
        ),
        Paint()..color = color.withOpacity(1 / (i + 1)),
      );

      startingPath = path;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
