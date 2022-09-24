/*!
* @author chenghua.wang
* @file   lib/LoginPage/animated_text.dart
* @reference  https://github.com/tomialagbe/flutter_ui_challenges/blob/master/travel/lib/animated_text.dart
*
* @brief  Animated text for login page. Reference from github. But changed to
* fit the new version of dart and Flutter 3.x
* */
import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final int delayInMilliseconds;
  final int durationInMilliseconds;
  final TextStyle? textStyle;

  const AnimatedText(this.text, this.delayInMilliseconds,
      {super.key, this.durationInMilliseconds = 2500, this.textStyle});

  @override createState() => AnimatedTextState(text);
}

class AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {

  String currentText = "";

  final String text;

  late AnimationController animationController;

  late List<int> textRunes;
  int curIndex = 0;

  AnimatedTextState(this.text) {
    textRunes = text.runes.toList();
  }

  @override
  void initState() {
    doSomeAsyncStuff();
  }

  Future<void> doSomeAsyncStuff() async {
    animationController = AnimationController(
        vsync: this,
        value: 0.0,
        lowerBound: 0.0,
        upperBound: textRunes.length.toDouble(),
        duration: Duration(
            milliseconds: widget.durationInMilliseconds));

    animationController.addListener(() {
      if (animationController.value.toInt() == 0) {
        setState(() {
          currentText = String.fromCharCode(textRunes[0]);
        });
      } else if (animationController.value.toInt() > curIndex &&
          animationController.value.toInt() < textRunes.length) {
        setState(() {
          curIndex = animationController.value.toInt();
          currentText += String.fromCharCode(textRunes[curIndex]);
        });
      }
    });

    await
    Future.delayed(Duration(milliseconds: widget.delayInMilliseconds));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(currentText, textAlign: TextAlign.left,
      style: widget.textStyle ??
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 28.0),);
  }
}