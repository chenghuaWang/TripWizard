import 'package:flutter/material.dart';
import 'package:trip_wizard/LoginPage/circles.dart';

class StackedCircles extends StatelessWidget {

  final double circleDiameter;
  final Matrix4? circle1Transform;
  final Matrix4? circle2Transform;

  const StackedCircles(this.circleDiameter,
      {super.key, this.circle1Transform, this.circle2Transform});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: circleDiameter * 2,
      height: circleDiameter,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: const Alignment(-0.5, 0.0),
            child: Circle(color: Colors.purple, diameter: circleDiameter),
          ),
          Align(
            alignment: const Alignment(0.5, 0.0),
            child: Opacity(
              opacity: 0.8,
              child: Circle(color: Colors.yellow, diameter: circleDiameter),
            ),
          ),
        ],
      ),
    );
  }
}

class StackedCirclesAnimation extends StatelessWidget {

  final Animation<double> controller;
  final Animation<double> diameter;
  final Animation<Alignment> alignment, alignment1;

  StackedCirclesAnimation({required Key key, required this.controller})
      :
        diameter = Tween<double>(
            end: 25.0,
            begin: 30.0
        ).animate(CurvedAnimation(parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.ease))),

        alignment = AlignmentTween(
          begin: const Alignment(-0.5, 0.0),
          end: const Alignment(0.2, 0.0),
        ).animate(CurvedAnimation(parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.ease))),

        alignment1 = AlignmentTween(
          begin: const Alignment(0.5, 0.0),
          end: const Alignment(-0.2, 0.0),
        ).animate(CurvedAnimation(parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.ease))),

        super(key: key);

  Widget buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: alignment.value,
          child: Circle(color: Colors.purple, diameter: diameter.value),
        ),
        Align(
          alignment: alignment1.value,
          child: Opacity(
            opacity: 0.8,
            child: Circle(color: Colors.yellow, diameter: diameter.value),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: buildAnimation,
      animation: controller,
    );
  }
}