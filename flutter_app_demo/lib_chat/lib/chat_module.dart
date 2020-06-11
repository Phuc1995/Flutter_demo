import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_chat/view/chat_page.dart';

import 'view/chat_page.dart';

class ChatModule extends ChildModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
  ];

  @override
  // TODO: implement routers
  List<Router> get routers => [
    Router("/", child: (_, args,) => ChatPage()),
  ];
}