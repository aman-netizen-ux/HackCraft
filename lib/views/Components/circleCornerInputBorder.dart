import 'package:flutter/material.dart';

class CircleCornerInputBorder extends InputBorder {
  final BorderSide borderSide;
  final Color circleFill;
  final Color circleBorder;

  const CircleCornerInputBorder( {this.circleFill=Colors.white, this.circleBorder= Colors.blue,this.borderSide = const BorderSide()});

  @override
  bool get isOutline => false;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final adjustedRect = Rect.fromLTWH(
      rect.left + borderSide.width / 2,
      rect.top + borderSide.width / 2,
      rect.width - borderSide.width,
      rect.height - borderSide.width,
    );

    return Path()..addRect(adjustedRect);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0,
    double gapPercentage = 0,
    TextDirection? textDirection,
  }) {
    if (borderSide.style == BorderStyle.none) {
      return;
    }

    final Paint borderPaint = Paint()
      ..color = borderSide.color // Color for the rectangle border
      ..strokeWidth = borderSide.width
      ..style = PaintingStyle.stroke;

    final Paint fillPaint = Paint()
      ..color = circleFill // Color for the fill of circles
      ..style = PaintingStyle.fill;

    final Paint circleBorderPaint = Paint()
      ..color = circleBorder// Color for the circle borders
      ..strokeWidth = borderSide.width
      ..style = PaintingStyle.stroke;

    // Draw the border rectangle
    final Path borderPath = Path()..addRect(rect);
    canvas.drawPath(borderPath, borderPaint);

    // Calculate the radius for the circles
    double radius = borderSide.width * 4; // Example radius size
    double offset = borderSide.width / 2;

    // Define the positions for the circles
    final Offset topLeftCircle = rect.topLeft.translate(offset, offset);
    final Offset topRightCircle = rect.topRight.translate(-offset, offset);
    final Offset bottomLeftCircle = rect.bottomLeft.translate(offset, -offset);
    final Offset bottomRightCircle = rect.bottomRight.translate(-offset, -offset);

    // Draw filled circles
    canvas.drawCircle(topLeftCircle, radius, fillPaint);
    canvas.drawCircle(topRightCircle, radius, fillPaint);
    canvas.drawCircle(bottomLeftCircle, radius, fillPaint);
    canvas.drawCircle(bottomRightCircle, radius, fillPaint);

    // Draw border circles
    canvas.drawCircle(topLeftCircle, radius, circleBorderPaint);
    canvas.drawCircle(topRightCircle, radius, circleBorderPaint);
    canvas.drawCircle(bottomLeftCircle, radius, circleBorderPaint);
    canvas.drawCircle(bottomRightCircle, radius, circleBorderPaint);
  }

  @override
  ShapeBorder scale(double t) {
    return CircleCornerInputBorder(
      borderSide: borderSide.scale(t),
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(borderSide.width);
  }

  @override
  InputBorder copyWith({BorderSide? borderSide}) {
    return CircleCornerInputBorder(
      borderSide: borderSide ?? this.borderSide,
    );
  }
}

class CircleCornerBoxDecoration extends Decoration {
  final Color circleFill;
  final Color circleBorder;
  final BorderSide borderSide;

  const CircleCornerBoxDecoration({
    this.circleFill = Colors.white,
    this.circleBorder = Colors.blue,
    this.borderSide = const BorderSide(),
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CircleCornerBoxPainter(this, onChanged);
  }
}

class _CircleCornerBoxPainter extends BoxPainter {
  final CircleCornerBoxDecoration decoration;

  _CircleCornerBoxPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint borderPaint = Paint()
      ..color = decoration.borderSide.color
      ..strokeWidth = decoration.borderSide.width
      ..style = PaintingStyle.stroke;

    final Paint fillPaint = Paint()
      ..color = decoration.circleFill
      ..style = PaintingStyle.fill;

    final Paint circleBorderPaint = Paint()
      ..color = decoration.circleBorder
      ..strokeWidth = decoration.borderSide.width
      ..style = PaintingStyle.stroke;

    canvas.drawPath(Path()..addRect(rect), borderPaint);

    double radius = decoration.borderSide.width * 4;
    double offsetValue = decoration.borderSide.width / 2;

    final Offset topLeftCircle = rect.topLeft.translate(offsetValue, offsetValue);
    final Offset topRightCircle = rect.topRight.translate(-offsetValue, offsetValue);
    final Offset bottomLeftCircle = rect.bottomLeft.translate(offsetValue, -offsetValue);
    final Offset bottomRightCircle = rect.bottomRight.translate(-offsetValue, -offsetValue);

    canvas.drawCircle(topLeftCircle, radius, fillPaint);
    canvas.drawCircle(topRightCircle, radius, fillPaint);
    canvas.drawCircle(bottomLeftCircle, radius, fillPaint);
    canvas.drawCircle(bottomRightCircle, radius, fillPaint);

    canvas.drawCircle(topLeftCircle, radius, circleBorderPaint);
    canvas.drawCircle(topRightCircle, radius, circleBorderPaint);
    canvas.drawCircle(bottomLeftCircle, radius, circleBorderPaint);
    canvas.drawCircle(bottomRightCircle, radius, circleBorderPaint);
  }
}


