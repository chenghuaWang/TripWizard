import 'package:flutter/material.dart';
import 'package:trip_wizard/LoginPage/circles.dart';

class SpreadCircles extends StatefulWidget {
  const SpreadCircles({super.key});

  @override
  State createState() => SpreadCirclesState();
}

class SpreadCirclesState extends State<SpreadCircles>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> purpleCircleDiameter;
  late Animation<double> yellowCircleDiameter;
  late Animation<double> greenCircleDiameter;

  @override
  void initState() {
    super.initState();

    animationController =
    AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    purpleCircleDiameter = Tween<double>(begin: 0.0, end: 130.0).animate(
        CurvedAnimation(parent: animationController,
            curve: const Interval(0.0, 0.6, curve: Curves.bounceInOut)));

    yellowCircleDiameter = Tween<double>(begin: 0.0, end: 80.0).animate(
        CurvedAnimation(parent: animationController,
            curve: const Interval(0.3, 0.7, curve: Curves.bounceInOut)));

    greenCircleDiameter = Tween<double>(begin: 0.0, end: 60.0).animate(
        CurvedAnimation(parent: animationController,
            curve: const Interval(0.6, 1.0, curve: Curves.easeIn)));

    purpleCircleDiameter.addListener(() {
      setState(() {});
    });

    greenCircleDiameter.addListener(() {
      setState(() {});
    });

    yellowCircleDiameter.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Align( // light green circle on the left border
            alignment: const Alignment(-1.0, -0.05),
            child: Circle(
              color: Colors.grey.withGreen(190).withOpacity(0.5),
              diameter: greenCircleDiameter.value,
              center: const Offset(10.0, 25.0),
            ),
          ),

          Align( // purple circle on the right border
            alignment: const Alignment(1.0, 0.24),
            child: Circle(
              color: Colors.purple.withOpacity(0.8),
              diameter: purpleCircleDiameter.value,
              center: const Offset(95.0, 75.0),
            ),
          ),

          Align( // yellow circle at the top
            alignment: const Alignment(0.6, -0.85),
            child: Circle(
                color: Colors.yellow.withOpacity(0.8),
                diameter: yellowCircleDiameter.value,
            ),
          ),
        ],
      ),
    );
  }
}