import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_feedback/feedback_module.dart';
import 'package:lib_login/login_module.dart';
import 'package:lib_home/home_module.dart';
import 'package:lib_map/map_module.dart';
import 'package:lib_chat/chat_module.dart';
import 'app_widget.dart';

class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/", module: LoginModule()),
    Router("/home", module: HomeModule()),
    Router("/feedback", module: FeedbackModule()),
    Router("/map", module: MapModule()),
    Router("/chat", module: ChatModule()),
  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}