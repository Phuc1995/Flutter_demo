import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set your initial route
      initialRoute: "/home",
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
    );
  }
}