import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_home/const/const.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BodyDetailWidget {
  Widget BodyDetail(
      BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250.0,
                key: Key("welcome"),
                child: ColorizeAnimatedTextKit(
                    totalRepeatCount: 10000,
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Welcome User",
                    ],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                    ),
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ],
                    textAlign: TextAlign.center,
                    alignment: AlignmentDirectional
                        .topStart // or Alignment.topLeft
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12),
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      key: Key("report"),
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.REPORT),
                            onPressed: () {
                            },
                          ),
                          Text("Report")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        key: Key("userManagement"),
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.USER_MANAGEMENT),
                            onPressed: () {

                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text("User"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      key: Key("docsManagement"),
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.DOCUMENT),
                            onPressed: () {
                            },
                          ),
                          Text("Document")
                        ],
                      ),
                    ),
                    Container(
                      key: Key("map"),
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.MAP),
                            onPressed: () {
                              Navigator.pushNamed(context, "/map");
                            },
                          ),
                          Text("Map")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width - 20,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 2),
                  dotSize: 5.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.black12,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 1.0,
                  images: [
                    Image.asset(Contanst.PIA2),
                    Image.asset(Contanst.PIA1),
                    Image.asset(Contanst.PIA3),
                    Image.asset(Contanst.PIA4),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12),
                height: 80,
                width: width,
                child: Row(
                  key: Key("upload"),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPLOAD_FILE),
                            onPressed: () {

                            },
                          ),
                          Text("Upload file")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.FEEDBACK),
                            onPressed: () {
                                Navigator.pushNamed(context, '/feedback');
                            },
                          ),
                          Text("Feedback")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12),
                height: 80,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12),
                height: 80,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12),
                height: 80,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                    Container(
                      width: width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(Contanst.UPDATE),
                            onPressed: () {},
                          ),
                          Text("New")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
