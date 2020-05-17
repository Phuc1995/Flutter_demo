import 'dart:async';
import 'package:lib_map/repository/place_service.dart';

class PlaceBloc{
  var _placeController = StreamController();

  Stream get placeController => _placeController.stream;

  void searchPlace(String keyword){
    print("place bloc search: " + keyword);

    _placeController.add("start");
    PlaceService.searchPlace(keyword).then((rs){
      print("----------start_search_place---------------------");
        _placeController.add(rs);
    }).catchError((){
        print("------------------------Error with Place_Bloc---------------------");
    });
  }

  void dispose(){
    _placeController.close();
  }

}