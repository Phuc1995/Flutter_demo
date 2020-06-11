import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  String _location = "location";
  LatLng _latLng = LatLng(10.797547, 106.669682);

  changeLocation(String newLocation) => _location = newLocation;
  changeLatLng(double lat, double long) => _latLng = LatLng(lat, long);

  String get location {
    return _location;
  }

  LatLng get latLng {
    return _latLng;
  }
}