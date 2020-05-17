import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_map/Const/MapConsts.dart';
import 'package:lib_map/bloc/place_bloc.dart';
import 'package:lib_map/model/place_item_res.dart';
import 'package:lib_map/view/map_page.dart';

class RidePickerPage extends StatefulWidget {
  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState() {
    // TODO: implement initState
    _addressController = TextEditingController(text: "Tran Hoang Na");
    super.initState();
  }

  @override
  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: 60,
                          child: Center(
                            child: Image.asset(MapConsts.ICON_LOCATION_BLACk),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 60,
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                _addressController.text = "";
                              },
                              child: Image.asset(MapConsts.ICON_REMOVE_X),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 30),
                          child: TextField(
                            controller: _addressController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (str) {
                              placeBloc.searchPlace(str);
                            },
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: StreamBuilder(
                  stream: placeBloc.placeController,
                  builder: (context, snapshot) {
                    if (snapshot.data !=  null) {
                      if (snapshot.data == 'start') {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<PlaceItemRes> places = snapshot.data;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(places.elementAt(index).name),
                              subtitle: Text(places.elementAt(index).adress),
                              onTap: () {
                                print("onTap");
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MapPage(
                                  ),
                                ));
                              },
                            );
                          },
                          itemCount: places.length);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
