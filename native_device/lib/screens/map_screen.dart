import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:native_device/models/places.dart';
import 'package:latlong/latlong.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation =
        const PlaceLocation(latitude: 37.422, longitude: -122.084),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapctrl = new MapController();
  List<LatLng> tappedPoints = [];
  @override
  Widget build(BuildContext context) {
    var _marker = tappedPoints.map((latlng) {
      return Marker(
          width: 100.0,
          height: 100.0,
          point: latlng,
          builder: (context) => Container(
              child: Icon(Icons.location_on,
                  size: 40.0, color: Theme.of(context).primaryColor)));
    }).toList();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tappedPoints.clear();
          });
        },
        child: Icon(
          Icons.location_disabled,
          color: Colors.white70,
        ),
      ),
      appBar: AppBar(title: Text('Your Map'), actions: <Widget>[
        if (tappedPoints.isNotEmpty)
          IconButton(
            icon: Icon(
              Icons.save,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              Navigator.of(context).pop(tappedPoints[0]);
            },
          )
      ]),
      body: FlutterMap(
        mapController: mapctrl,
        layers: [_crearMapa(), MarkerLayerOptions(markers: _marker)],
        options: MapOptions(
            center: widget.initialLocation.getLatLng(),
            zoom: 17,
            onTap: _handleTap),
      ),
    );
  }

  void _handleTap(LatLng latlng) {
    setState(() {
      tappedPoints.clear();
      tappedPoints.add(latlng);
      print(latlng.latitude);
    });
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate: "https://api.tiles.mapbox.com/v4/"
            "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiYmphdmllcjkiLCJhIjoiY2s4bTh1amwxMDlhMjNkbnZsdGk1OWE2NSJ9.P2wRl6fmGHXqCDLtuxI49A',
          'id': 'mapbox.streets',
          // dark, light, outdoors, satellite
        });
  }
}
