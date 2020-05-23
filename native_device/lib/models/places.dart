import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:latlong/latlong.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });

  LatLng getLatLng() {
    return LatLng(latitude, longitude);
  }
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
