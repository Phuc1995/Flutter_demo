import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_map/view/map_page.dart';
class MapModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => MapPage(), transition: TransitionType.rightToLeft),
  ];
  static Inject get to => Inject<MapModule>.of();
}