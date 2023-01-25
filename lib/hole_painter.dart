import 'package:flutter/material.dart';

class HolePainter extends CustomPainter {
  final Color color;
  final double holeSize;

  const HolePainter({
    required this.color,
    required this.holeSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = holeSize / 2;

    final rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );

    final outerCircleRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    final innerCircleRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius / 2,
    );

    final transparentHole = Path.combine(
      PathOperation.difference,
      Path()..addRect(rect),
      Path()
        ..addOval(outerCircleRect)
        ..close(),
    );

    final halfTransparentRing = Path.combine(
      PathOperation.difference,
      Path()
        ..addOval(outerCircleRect)
        ..close(),
      Path()
        ..addOval(innerCircleRect)
        ..close(),
    );

    canvas.drawPath(transparentHole, Paint()..color = color);

    canvas.drawPath(
      halfTransparentRing,
      Paint()..color = color.withOpacity(0.5),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
