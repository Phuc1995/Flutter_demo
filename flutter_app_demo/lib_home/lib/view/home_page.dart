import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_home/view/widget/body_detail_widget.dart';
import 'package:lib_home/view/widget/bottom_bar_widget.dart';
import 'package:lib_home/const/const.dart';

class HomePage extends StatelessWidget {
  final int countNotification = null;
  final widgetBottomBar = new WidgetBottomBar();
  final bodyDetailWidget = new BodyDetailWidget();

//  Widget showCountNotification(HomeService) {
//    return FutureBuilder<int>(
//      future: homeService.getNumberNotification(),
//      builder:
//          (BuildContext context, AsyncSnapshot<int> snapshot) {
//        switch (snapshot.connectionState) {
//          case ConnectionState.done:
//            return Padding(
//              padding: const EdgeInsets.only(left: 25, top: 10),
//              child: (snapshot.data == null) ? Container(): Container(color: Colors.red, child: Text(" ${snapshot.data} ")),
//            );
//          default:
//            return Container();
//        }
//      },
//    );
//  }

  nested(BuildContext context, double width) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: IconButton(
              key: Key("advertisement"),
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
              },
            ),
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
            actions: <Widget>[

              Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                    ),
                    onPressed: () {

                      ;
                    },

                  ),
//                  showCountNotification(homeService),
                ],
              ),
              IconButton(
                key: Key("signOut"),
                icon: Icon(
                  Icons.exit_to_app,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/',);
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("App Demo"),
              background: Opacity(
                child: Image.asset(
                  Contanst.APP_BAR,
                  fit: BoxFit.cover,
                ),
                opacity: 0.7,
              ),
            ),
          )
        ];
      },
      body: bodyDetailWidget.BodyDetail(context, width),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      body: nested(context,
        width,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
          } else if (index == 1) {
          } else if (index == 2) {}
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.23),
        items: [
          widgetBottomBar.BottomNavigationBar(
              icon: Icon(
                Icons.home,
              ),
              title: "Home"),
          widgetBottomBar.BottomNavigationBar(
              icon: Icon(
                Icons.camera_alt,
              ),
              title: "Camera ",
              key: "takePhoto"),
          widgetBottomBar.BottomNavigationBar(
              icon: Icon(
                Icons.message,
              ),
              title: "Chat"),
        ],
      ),
    );
  }
}

