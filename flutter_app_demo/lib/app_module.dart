import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_login/view/login_page.dart';
import 'package:lib_home/view/home_page.dart';
import 'app_widget.dart';

class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => LoginPage()),
    Router("/home", child: (_, args) => HomePage()),
  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}