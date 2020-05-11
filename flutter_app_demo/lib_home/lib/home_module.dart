import 'package:flutter_modular/flutter_modular.dart';
import 'view/home_page.dart';
class LoginModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => HomePage()),
  ];
  static Inject get to => Inject<LoginModule>.of();
}