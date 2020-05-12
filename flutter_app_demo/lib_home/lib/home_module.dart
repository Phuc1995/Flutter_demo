import 'package:flutter_modular/flutter_modular.dart';
import 'view/home_page.dart';
class HomeModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => HomePage(), transition: TransitionType.downToUp),
  ];
  static Inject get to => Inject<HomeModule>.of();
}