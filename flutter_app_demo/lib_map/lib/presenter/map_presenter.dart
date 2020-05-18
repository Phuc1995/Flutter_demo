import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lib_map/model/map_model.dart';

class MapPresenter{
  GoogleMapController mapController;
  var mapModel = MapModel();

  Future<void> gotoLocation(double lat, double long,
      Completer<GoogleMapController> _controller) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: mapModel.changeLatLng(lat, long),
      zoom: 17,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}