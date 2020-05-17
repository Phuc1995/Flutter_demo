import 'package:flutter/material.dart';

class MapMenu extends StatefulWidget {
  @override
  _MapMenuState createState() => _MapMenuState();
}

class _MapMenuState extends State<MapMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text(
            "Ride History",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text(
            "Offers",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text(
            "Notifications",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text(
            "Help & Supports",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        )
      ],
    );
  }
}
