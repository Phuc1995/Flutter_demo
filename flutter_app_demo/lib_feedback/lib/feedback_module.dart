import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_feedback/view/feedback_page.dart';

class FeedbackModule extends ChildModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => null;

  @override
  // TODO: implement routers
  List<Router> get routers => [
    Router("/", child: (_, args,) => FeedbackPage()),
  ];


}