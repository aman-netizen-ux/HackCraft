import 'package:flutter/material.dart';
import 'dart:math' as math;

class HollowCircle extends StatelessWidget {
  const HollowCircle({super.key, required this.side, required this.width, this.gradient, this.color=Colors.white, this.isSemicircle=false, required this.diameter});
  final String side;
  final double width;
  final LinearGradient? gradient;
  final Color color;
  final bool isSemicircle;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(400, 200/2), // Size of the semicircle
        painter: ConfigurableSemicirclePainter(
          side: side, 
          width: width, 
          color: color,
          isSemicircle: isSemicircle,
          gradient: gradient),
      ),
    );
  }
}

class ConfigurableSemicirclePainter extends CustomPainter {
  final String side;
  final double width;
  final LinearGradient? gradient;
  final Color color;
  final bool isSemicircle;

  ConfigurableSemicirclePainter(
      {required this.side,
      required this.width,
      this.gradient,
      required this.color,
      required this.isSemicircle});

  @override
  void paint(Canvas canvas, Size size) {
    // Create a rectangle for the semicircle based on the side parameter

    Rect rect;
    if (side == 'bottom') {
      rect = Rect.fromLTRB(0, -size.height, size.width, size.height);
    } else if (side == 'top') {
      rect = Rect.fromLTRB(0, 0, size.width, size.height * 2);
    } else if (side == 'left') {
      rect = Rect.fromLTRB(
          size.height, -size.height, size.height * 3, size.height);
    } else {
      rect = Rect.fromLTRB(0, -size.height, size.width, size.height);
    }

    double startAngle = (side == 'bottom')
        ? math.pi
        : (side == 'bottom')
            ? 0.0
            : (side == 'bottom')
                ? math.pi / 2
                : -math.pi / 2; // Start angle adjusted
    double sweepAngle =
        (side == 'left') ? -math.pi : math.pi; // Sweep angle for a semicircle

    final paint = Paint()
      ..color = gradient != null ? Colors.transparent : color
      ..shader = gradient?.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    // Draw the arc
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
