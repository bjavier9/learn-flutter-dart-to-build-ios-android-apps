import 'dart:convert';
import 'package:http/http.dart' as http;

const MAP_BOX_KEY =
    'pk.eyJ1IjoiYmphdmllcjkiLCJhIjoiY2s4bTh1amwxMDlhMjNkbnZsdGk1OWE2NSJ9.P2wRl6fmGHXqCDLtuxI49A';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitud}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/$longitud,$latitude,17,0/600x300?access_token=$MAP_BOX_KEY';
  }

  static Future<String> getPlaceAdress(double lat, double lng) async {
    final url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json?access_token=$MAP_BOX_KEY&es=address';
    final response = await http.get(url);
    return json.decode(response.body)["features"][0]["place_name"];
  }
}
