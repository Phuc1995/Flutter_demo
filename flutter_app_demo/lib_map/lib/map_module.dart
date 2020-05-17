import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_map/view/map_page.dart';
import 'package:lib_map/view/ride_picker_page.dart';
import 'package:lib_map/bloc/place_bloc.dart';
import 'package:lib_map/view/widget/ride_picker.dart';
class MapModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
//    Bind((i) => new PlaceBloc()),
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => MapPage(), transition: TransitionType.rightToLeft),
    Router("/ride_picker", child: (_, args) => RidePickerPage(), transition: TransitionType.rightToLeft),
  ];
  static Inject get to => Inject<MapModule>.of();
}