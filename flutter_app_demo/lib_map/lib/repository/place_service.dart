import 'dart:convert';
import 'package:lib_map/model/place_item_res.dart';
import 'package:http/http.dart' as http;
import 'package:lib_map/Const/MapConsts.dart';

class PlaceService {
  static Future<List<PlaceItemRes>> searchPlace(String keyword) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=" +
            MapConsts.KEY_MAP +
            "&language=vi&region=VN&query=" +
            Uri.encodeQueryComponent(keyword);

    print("search >>: " + url);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      print(res.statusCode );
      return PlaceItemRes.fromJson(json.decode(res.body));
    } else {
      return new List();
    }
  }
}