import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lib_map/presenter/map_presenter.dart';

class MarkerDetail {
  Widget _boxes(String _image, double lat, double long, String restaurantName,
      Completer<GoogleMapController> _controller, MapPresenter mapPresenter) {
    return GestureDetector(
      onTap: () {
        mapPresenter.gotoLocation(lat, long, _controller);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget buildContaniner(
      MapPresenter mapPresenter, Completer<GoogleMapController> _controller) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100,
        child: ListView(
          key: Key("agentList"),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              key: Key('taTuaRian'),
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  10.796175,
                  106.667201,
                  "Tà Tưa Rian",
                  _controller,
                  mapPresenter),
            ),
            SizedBox(width: 10.0),
            Padding(
              key: Key('taTuaAZ'),
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  10.795227,
                  106.669841,
                  "Tà Tưa A-Z",
                  _controller,
                  mapPresenter),
            ),
            SizedBox(width: 10.0),
            Padding(
              key: Key('taTuaDaiLoan'),
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  10.793446,
                  106.670130,
                  "Tà Tưa Đài Loan",
                  _controller,
                  mapPresenter),
            ),
            SizedBox(width: 10.0),
            Padding(
              key: Key('gramercyTavern'),
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380,
                  -73.988426,
                  "Gramercy Tavern",
                  _controller,
                  mapPresenter),
            ),
          ],
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
                restaurantName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _infoOnVote("4.1"),
                _starVote(),
                _starVote(),
                _starVote(),
                _starVote(),
                _starVote(),
                _infoOnVote("(946)"),
              ],
            )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _starVote() {
    return Container(
      child: Icon(
        FontAwesomeIcons.solidStar,
        color: Colors.amber,
        size: 15.0,
      ),
    );
  }

  Widget _infoOnVote(String text) {
    return Container(
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
          ),
        ));
  }
}