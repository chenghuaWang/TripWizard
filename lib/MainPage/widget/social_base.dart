import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF3E4067);
const kTextColor = Color(0xFF3F4168);
const kIconColor = Color(0xFF5E5E5E);

const kDefaultPadding = 20.0;

final kDefualtShadow = BoxShadow(
  offset: const Offset(5, 5),
  blurRadius: 10,
  color: const Color(0xFFE9E9E9).withOpacity(0.56),
);

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  // Our designer use iPhone 11 Pro, that's why we use 815.0
  return (inputHeight / 815.0) * screenHeight!;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  // 414 is the layout width that designer use or you can say iPhone 11 Pro width
  return (inputWidth / 414.0) * screenWidth!;
}

// For add free space vertically
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key? key,
    this.of = 25,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(of),
    );
  }
}