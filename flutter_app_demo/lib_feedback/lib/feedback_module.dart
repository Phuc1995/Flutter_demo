import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_feedback/service/feedback_store.dart';
import 'package:lib_feedback/view/feedback_complete_page.dart';
import 'package:lib_feedback/view/feedback_page.dart';

import 'model/feedback_model.dart';

class FeedbackModule extends ChildModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => new FeedbackStore(feedbackModel: FeedbackModel()))
  ];

  @override
  // TODO: implement routers
  List<Router> get routers => [
    Router("/", child: (_, args,) => FeedbackPage()),
    Router("/complete", child: (_, args) => FeedbackComplete()),
  ];


}