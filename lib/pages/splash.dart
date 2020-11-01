import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class ClearSplash extends StatelessWidget {
  final String route;
  ClearSplash(this.route);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      imageBackground: AssetImage('assets/images/splash.jpg'),
      navigateAfterSeconds: route,
    );
  }
}
