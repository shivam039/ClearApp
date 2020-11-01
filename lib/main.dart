import 'package:clearapp/routes/router.dart';
import 'package:flutter/material.dart';
import 'pages/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        accentColor: Colors.orange,
        brightness: Brightness.light,
        primaryColor: Colors.blue),
    home: ClearSplash('home'),
    initialRoute: '/',
    onGenerateRoute: ClearRouter.generateRoute,
  ));
}
