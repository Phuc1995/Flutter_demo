import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_login/view/register/register_page.dart';
import 'package:lib_login/blocs/register_bloc.dart';

import 'view/login_page.dart';
class LoginModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => new RegisterBloc()),
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => LoginPage(), transition: TransitionType.rightToLeft),
    Router("/register", child: (_, args) => RegisterPage(), transition: TransitionType.leftToRight),
  ];
  static Inject get to => Inject<LoginModule>.of();
}