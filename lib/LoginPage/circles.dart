import 'package:flutter/material.dart';

class Circle extends StatelessWidget {

  final Color color;
  final double diameter;
  final Offset? center;

  const Circle({super.key, required this.color, required this.diameter, this.center});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(diameter, diameter),
      painter: CirclePainter(color, center: center),
    );
  }

}

class CirclePainter extends CustomPainter {

  final Color color;
  final Offset? center;

  CirclePainter(this.color, {this.center});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        center ?? new Offset(size.width / 2, size.height / 2), size.width / 2,
        Paint()..color = this.color);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

}