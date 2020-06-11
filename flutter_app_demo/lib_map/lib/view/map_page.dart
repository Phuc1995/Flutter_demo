import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lib_map/model/place_item_res.dart';
import 'package:lib_map/presenter/map_presenter.dart';
import 'package:lib_map/view/widget/map_menu.dart';
import 'package:lib_map/view/widget/marker_show_detail.dart';
import 'package:lib_map/view/widget/ride_picker.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapWidget = new MarkerDetail();
  final mapPresenter = MapPresenter();
  Completer<GoogleMapController> _controller = Completer();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  static final CameraPosition _location = CameraPosition(
    target: LatLng(10.797547, 106.669682),
    zoom: 14.4746,
  );

  static final CameraPosition _tmaLab3 = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(10.797421, 106.669618),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _location,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {
                markerFution("TeaMilk1", 10.796175, 106.667201, "Tà Tưa Rian"),
                markerFution("TeaMilk2", 10.795227, 106.669841, "Tà Tưa A-Z"),
                markerFution(
                    "TeaMilk3", 10.793446, 106.670130, "Tà Tưa Đài Loan"),
                markerFution("TeaMilk4", 10.799392, 106.671576, "Tà Tưa Omija"),
                markerFution("TeaMilk5", 40.738380, -73.988426, "Tà Tưa Rian"),
                markerFution("TMA", 10.797772, 106.669168, "TMA Lab 3","lab3"),
              },
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text("Map", style: TextStyle(color: Colors.black),),
                    elevation: 0.0,
                    leading: FlatButton(
                      onPressed: (){
                        print("Click menu");
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(Icons.menu),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(Icons.notifications, color: Colors.black,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RidePicker(),
                  )
                ],
              ),
            ),
            mapWidget.buildContaniner(mapPresenter, _controller),
          ],
        ),
      ),
      drawer: Drawer(
        child: MapMenu(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the Lab3!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }


  Marker markerFution(
      String markerId, double lat, double long, String infoWindow,
      [String locationDefault]) {
    return Marker(
        markerId: MarkerId("$markerId"),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: "$infoWindow"),
        icon: locationDefault != null ? BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed) : BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet)
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_tmaLab3));
  }
}
