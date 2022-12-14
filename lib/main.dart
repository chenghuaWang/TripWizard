/*!
* @author chenghua.wang
* @file   lib/main.dart
* @brief  The main loop for UI rendering. There must be another isolate
* part for event getter and Http/TCP passer.
*
* @licence  This software has no licence. But you should follow the rules
* that the dependencies libs in this software provided.
* */
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import theme
import 'package:trip_wizard/MainPage/utils/const.dart';

// import Http client side
import 'package:trip_wizard/ClientHttpIO/core.dart';

// import pages
// Layer 1. Landing Layer / Splashing Layer.
import 'LoginPage/landing_page.dart';
import 'package:trip_wizard/LoginPage/layer.dart';
// Layer 2. Sign in / Sign up
import 'package:trip_wizard/LoginPage/pages/login_page.dart';
// Layer3. Main Page
import 'package:trip_wizard/MainPage/layer.dart';

class TripWizardEnter extends StatelessWidget{
  TripWizardEnter({super.key});

  final ClientIO _clientIO = ClientIO();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: 'MainPage',
      debugShowCheckedModeBanner: false,
      title: 'Trip Wizard',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/landing':
            return MaterialPageRoute(
                builder: (_) => const LandingPage(),
                settings: settings
            );
          case '/login':
            return MaterialPageRoute(
                builder: (_)=>const LoginPage(),
                settings: settings
            );
          case '/main':
            return MaterialPageRoute(
                builder: (_)=>const MainScreen(),
                settings: settings
            );
          case '/usr':
          case '/explore':
          case '/video':
        }
        return null;
      },
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: const LandingPage(),
    );
  } //! [function] build, return Widget
} //! [Class] __TripWizardEnter

void main() {
  runApp(TripWizardEnter());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }
}
