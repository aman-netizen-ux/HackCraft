import 'package:flutter/material.dart';

enum TooltipSide { left, right, top, bottom }

class ToolTipCustomDecoration extends ShapeBorder {
  final bool isPaddingRequired;
  final TooltipSide side;
  final Color borderColor;  // Add this field to specify border color
  final double borderWidth;  // Add this field to specify border width

  const ToolTipCustomDecoration({this.isPaddingRequired = true, this.side = TooltipSide.bottom,  this.borderColor = Colors.black, 
    this.borderWidth = 2.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(
        bottom: isPaddingRequired && side == TooltipSide.bottom ? 20 : 0,
        top: isPaddingRequired && side == TooltipSide.top ? 20 : 0,
        left: isPaddingRequired && side == TooltipSide.left ? 20 : 0,
        right: isPaddingRequired && side == TooltipSide.right ? 20 : 0,
      );

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double triangleHeight = 7;  // Reduced triangle height for all sides
    final double triangleBase = 10;    // Base of the triangle

    // Adjust rectangle based on the tooltip side
    switch (side) {
      case TooltipSide.top:
        rect = Rect.fromPoints(rect.topLeft + const Offset(0, 20), rect.bottomRight);
        break;
      case TooltipSide.bottom:
        rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
        break;
      case TooltipSide.left:
        rect = Rect.fromPoints(rect.topLeft + const Offset(20, 0), rect.bottomRight);
        break;
      case TooltipSide.right:
        rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(20, 0));
        break;
    }

    Path path = Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 9)));

    // Draw the triangle on the specified side
    switch (side) {
      case TooltipSide.top:
        path.moveTo(rect.topCenter.dx - triangleBase / 2, rect.topCenter.dy);
        path.relativeLineTo(triangleBase / 2, -triangleHeight);
        path.relativeLineTo(triangleBase / 2, triangleHeight);
        break;
      case TooltipSide.bottom:
        path.moveTo(rect.bottomCenter.dx - triangleBase / 2, rect.bottomCenter.dy);
        path.relativeLineTo(triangleBase / 2, triangleHeight);
        path.relativeLineTo(triangleBase / 2, -triangleHeight);
        break;
      case TooltipSide.left:
        path.moveTo(rect.centerLeft.dx, rect.centerLeft.dy - triangleBase / 2);
        path.relativeLineTo(-triangleHeight, triangleBase / 2);
        path.relativeLineTo(triangleHeight, triangleBase / 2);
        break;
      case TooltipSide.right:
        path.moveTo(rect.centerRight.dx, rect.centerRight.dy - triangleBase / 2);
        path.relativeLineTo(triangleHeight, triangleBase / 2);
        path.relativeLineTo(-triangleHeight, triangleBase / 2);
        break;
    }

    path.close();
    return path;
  }


 @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = getOuterPath(rect, textDirection: textDirection);

    // Paint the border
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}