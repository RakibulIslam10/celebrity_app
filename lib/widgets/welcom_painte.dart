import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

class WelcomPainte extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 108);
    path_0.lineTo(293, 0);
    path_0.lineTo(283, 108);
    path_0.lineTo(0, 194);
    path_0.lineTo(0, 108);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff0FBAF3).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomContainerShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(-21, 158.5);
    path_0.lineTo(422.5, 0);
    path_0.lineTo(422.5, 108);
    path_0.lineTo(-21, 266.5);
    path_0.lineTo(-21, 158.5);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFDCD5D).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
