/*!
* @author chenghua.wang
* @file   lib/LoginPage/animated_locations_text.dart
* @reference  https://github.com/tomialagbe/flutter_ui_challenges/blob/master/travel/lib/
*
* @brief  Animated text for login page. Reference from github. But changed to
* fit the new version of dart and Flutter 3.x
* */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trip_wizard/LoginPage/animated_text.dart';

enum AnimationType {
  Character,
  SlideDown
}

class AnimatedLocationsText extends StatefulWidget {

  final int delayInMilliseconds;

  const AnimatedLocationsText(this.delayInMilliseconds, {super.key});

  @override
  State createState() => _AnimationState();
}

class _AnimationState extends State<AnimatedLocationsText>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Alignment> hangzhouSlideOut;
  late Animation<double> hangzhouFadeOut;

  late Animation<Alignment> beiJingSlideIn;
  late Animation<double> beiJingFadeIn;
  late Animation<Alignment> beiJingSlideOut;
  late Animation<double> beiJingFadeOut;

  late Animation<Alignment> shangHaiSlideIn;
  late Animation<double> shangHaiFadeIn;

  String firstLocation = "上海";
  String secondLocation = "杭州";
  String thirdLocation = "世界各地";

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 6));

    hangzhouSlideOut = AlignmentTween(
        begin: const Alignment(-1.0, 0.0), end: const Alignment(-1.0, 1.0))
        .animate(CurvedAnimation(parent: animationController,
        curve: const Interval(0.4, 0.45, curve: Curves.easeIn)));
    hangzhouFadeOut =  Tween<double>(begin: 1.0, end: 0.0)
        .animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.42, 0.45, curve: Curves.easeIn)));

    beiJingSlideIn =  AlignmentTween(
      begin: const Alignment(-1.0, -1.0), end: const Alignment(-1.0, 0.0),
    ).animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.42, 0.45, curve: Curves.easeIn)));
    beiJingFadeIn =  Tween<double>(begin: 0.0, end: 1.0)
        .animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.42, 0.45)));

    beiJingSlideOut =  AlignmentTween(
        begin: const Alignment(-1.0, 0.0), end: const Alignment(-1.0, 1.0))
        .animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.8, 0.85, curve: Curves.easeIn)));
    beiJingFadeOut =  Tween<double>(begin: 1.0, end: 0.0)
        .animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.82, 0.85)));

    shangHaiSlideIn = AlignmentTween(
        begin: const Alignment(-1.0, -1.0), end: const Alignment(-1.0, 0.0))
        .animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.8, 0.85, curve: Curves.easeIn)));
    shangHaiFadeIn =  Tween<double>(begin: 0.0, end: 1.0)
        .animate( CurvedAnimation(parent: animationController,
        curve: const Interval(0.82, 0.85)));

    hangzhouSlideOut.addListener(() {
      setState(() {});
    });
    hangzhouFadeOut.addListener(() {
      setState(() {});
    });

    beiJingSlideIn.addListener(() {
      setState(() {});
    });
    beiJingFadeIn.addListener(() {
      setState(() {});
    });

    beiJingSlideOut.addListener(() {
      setState(() {});
    });
    beiJingFadeOut.addListener(() {
      setState(() {});
    });

    shangHaiSlideIn.addListener(() {
      setState(() {});
    });
    shangHaiFadeIn.addListener(() {
      setState(() {});
    });

    Future.delayed(
        Duration(milliseconds: widget.delayInMilliseconds + 250))
        .then((_) {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Stack(
        children: <Widget>[
          // Hangzhou
          Align(
            alignment: hangzhouSlideOut.value,
            child: Opacity(
              opacity: hangzhouFadeOut.value,
              child: AnimatedText("上海", widget.delayInMilliseconds,
                durationInMilliseconds: 500,
                textStyle: const TextStyle(color: Colors.green,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),),
            ),
          ),
          // BeiJing
          AlignTransition(
            alignment: !(beiJingSlideIn.value.y == 0.0)
                ? beiJingSlideIn
                : beiJingSlideOut,
            child: Opacity(
              opacity: !(beiJingFadeIn.value == 1.0)
                  ? beiJingFadeIn.value
                  : beiJingFadeOut.value,
              child: Text(secondLocation, style: TextStyle(
                  color: Colors.lightBlue.withOpacity(0.7),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700),
              ),
            ),
          ),

          // Shang Hai
          Align(
            alignment: shangHaiSlideIn.value,
            child: Opacity(
              opacity: shangHaiFadeIn.value,
              child: Text(thirdLocation, style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700),),
            ),
          ),

        ],
      ),
    );
  }

}
