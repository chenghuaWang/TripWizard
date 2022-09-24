/*!
* @author chenghua.wang
* @file   lib/LoginPage/animated_background.dart
* @reference  https://github.com/tomialagbe/flutter_ui_challenges/blob/master/travel/lib/
*
* @brief  Animated text for login page. Reference from github. But changed to
* fit the new version of dart and Flutter 3.x
* */
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State createState() => AnimatedBackgroundState();

}

class AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> imageSizeAnimation;
  late Animation<double> imageSlideAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 6000));
    imageSizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.0, 0.1, curve: Curves.bounceInOut)));
    imageSlideAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(parent: animationController,
            curve: const Interval(0.1, 1.0, curve: Curves.linear)));

    imageSlideAnimation.addListener(() {
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
      child: Align(
        alignment: const Alignment(1.0, -0.3),

        child: ClipPath(
          clipper: _AnimatedBackgroundImageClipper(),
          child: Image(
              alignment: Alignment(imageSlideAnimation.value, 0.0),
              width: 250.0 * imageSizeAnimation.value,
              height: 350.0 * imageSizeAnimation.value,
              image: const AssetImage("assets/images/login_head.jpg"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _AnimatedBackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset ctrl;
    Offset end;

    Path path = Path();
    path.moveTo(size.width, 0.0);

    path.lineTo(0.2 * size.width, size.height * 0.5 - 40);

    ctrl = Offset(-0.35 * size.width, size.height);
    end = Offset(0.6 * size.width, size.height * 0.95);
    path.quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy);

    path.lineTo(0.6 * size.width, size.height * 0.95);

    ctrl = Offset(0.7 * size.width, size.height - 20);
    end = Offset(0.8 * size.width, size.height * 0.9);
    path.quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy);

    path.lineTo(0.8 * size.width, size.height * 0.9);

    ctrl = Offset(0.9 * size.width, size.height * 0.9 - 15);
    end = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy);

    path.lineTo(size.width, size.height * 0.8);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}