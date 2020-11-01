import 'package:flutter/material.dart';
import 'package:clearapp/pages/basicList.dart';
import 'package:clearapp/pages/landingPage.dart';

class ClearRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'baisclist':
        return MaterialPageRoute(
          builder: (_) => new BaiscList(),
        );
      case 'home':
        return MaterialPageRoute(
          builder: (_) => new LandingPage(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
