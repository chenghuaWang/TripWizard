import 'package:flutter/material.dart';

class SplashPageToLandingPageRoute<T> extends MaterialPageRoute<T> {
  SplashPageToLandingPageRoute(
      { required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 256);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.name == "MainPage") {
      return child;
    }
    final curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
    return FadeTransition(opacity: curve, child: child);
  }
}