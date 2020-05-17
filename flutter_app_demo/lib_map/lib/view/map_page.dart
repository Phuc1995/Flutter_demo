import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lib_map/model/place_item_res.dart';
import 'package:lib_map/view/widget/map_menu.dart';
import 'package:lib_map/view/widget/ride_picker.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  static final CameraPosition _location = CameraPosition(
    target: LatLng(10.856072, 106.630955),
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
            )
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


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_tmaLab3));
  }
}
