import 'package:flutter/material.dart';
import 'package:trip_wizard/LoginPage/animated_background.dart';
import 'package:trip_wizard/LoginPage/animated_locations_text.dart';
import 'package:trip_wizard/LoginPage/animated_text.dart';
import 'package:trip_wizard/LoginPage/spread_circles.dart';
import 'package:trip_wizard/LoginPage/stacked_circles.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {

  late AnimationController buttonAnimationController;
  late Animation<AlignmentGeometry> buttonAlignment;
  late Animation<double> buttonOpacity;

  @override
  void initState() {
    super.initState();
    buttonAnimationController =  AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    buttonAlignment =  AlignmentTween(
      begin: const Alignment(0.0, 1.0),
      end: const Alignment(0.0, 0.95),
    ).animate( CurvedAnimation(
      parent: buttonAnimationController,
      curve: const Interval(0.3, 0.9, curve: Curves.easeInOut),));
    buttonOpacity =  Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate( CurvedAnimation(
      parent: buttonAnimationController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),));

    buttonAlignment.addListener(() {
      setState(() {});
    });
    buttonOpacity.addListener(() {
      setState(() {});
    });

    buttonAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    buttonAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Stack(
        children: <Widget>[
          const AnimatedBackground(),
          _buildStackedCircles(),
          const SpreadCircles(),
          _buildButtomButtons(),
          _buildAnimatedText(),
        ],
      ),
    );
  }

  Widget _buildAnimatedText() {
    final animatedTextDelay = 800;

    return  Align(
        alignment: const Alignment(-1.0, -0.75),
        child:  Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AnimatedText(
                  "在", animatedTextDelay,
                  durationInMilliseconds: 2500),
              AnimatedLocationsText(animatedTextDelay + 256),
              AnimatedText(
                    "开始你的奇妙旅程", animatedTextDelay,
                    durationInMilliseconds: 2500),
            ],
          ),
        )
    );
  }

  Widget _buildStackedCircles() {
    final circleDiameter = 25.0;
    return  Align(
      alignment: const Alignment(0.0, -0.9),
      child:  Hero(
        tag: "CircleHeroTag",
        child:  StackedCircles(circleDiameter),
      ),
    );
  }

  Widget _buildButtomButtons() {
    return  AnimatedBuilder(
        animation: buttonAnimationController,
        child:  Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createAccountButton(),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              _signInButton(),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              _termsAndConditions(),
            ],
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return  Align(
            alignment: buttonAlignment.value,
            child:  Opacity(
              opacity: buttonOpacity.value,
              child: child,
            ),
          );
        }
    );
  }

  Widget _createAccountButton() {
    return  GestureDetector(
      child:  Material(
        child:  Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration:  BoxDecoration(
            borderRadius:  BorderRadius.circular(5.0),
            gradient: const  LinearGradient(
                colors: <Color>[
                  Colors.green,
                  Colors.greenAccent,
                ]
            ),
          ),
          alignment: Alignment.center,
          child: const Text("创建账户",
            style: TextStyle(color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed("/login");
      },
    );
  }

  Widget _signInButton() {
    return  GestureDetector(
      child:  Material(
        child:  Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration:  BoxDecoration(
            borderRadius:  BorderRadius.circular(5.0),
            gradient:  LinearGradient(
                colors: <Color>[
                  Colors.amberAccent.withAlpha(150),
                  Colors.amberAccent.withAlpha(100),
                ]
            ),
          ),
          alignment: Alignment.center,
          child: const Text("登录",
            style: TextStyle(color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed("/login");
      },
    );
  }

  Widget _termsAndConditions() {
    const textStyle = TextStyle(fontSize: 13.0, color: Colors.black38);
    return GestureDetector(
        child:  Material(
          child: RichText(
            textAlign: TextAlign.center,
            text:  const TextSpan(
            text: "你需要同意许可来使用我们提供的服务",
              style: textStyle,
                children: <TextSpan>[
                    TextSpan(text: "服务说明/条件",
                    style: TextStyle(decoration: TextDecoration.underline)),
                  ],
            ),
          )
        ),
      onTap: (){
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('服务条款申明'),
                content: RichText(text: const TextSpan(
                  text: "This software is a part of SWE 2022-2023 Fall's paired "
                      "project. And we used lots of code from awesome-flutter."
                      "This project is totally open source. However, due to the "
                      "dependence we used is not licence free, if you want to use "
                      "this app, you should agree all policies of those 3rd party "
                      "libs or assets.\n"
                      "\n"
                      "\n"
                      "Author: chenghua.wang.(chenghua.wang.edu@gmail.com) \n"
                      "corresponding author: yunzi.sun",
                  style: textStyle,
                )),
                actions: <Widget>[
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('回退'),
                  ),
                ],
              );
            });
      },
    );
  }
}