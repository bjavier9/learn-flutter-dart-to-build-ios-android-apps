import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:native_device/helpers/location_helper.dart';
import '../helpers/db_helper.dart';

import '../models/places.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  void addPlace(String picketTitle, File picketImage,
      PlaceLocation pickedLocation) async {
    final address = await LocationHelper.getPlaceAdress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updateLocation = PlaceLocation(
        longitude: pickedLocation.longitude,
        latitude: pickedLocation.latitude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: picketTitle,
        image: picketImage,
        location: updateLocation);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address
    });
  }

  Future<void> fecthAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
                latitude: item['loc_lat'],
                longitude: item['loc_lng'],
                address: item['address'])))
        .toList();
    notifyListeners();
  }
}
