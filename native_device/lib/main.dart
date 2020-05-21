import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/places_lists_cren.dart';
import './screens/add_places_screen.dart';
import './providers/great_pleaces.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Material App',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlacesListScreen(),
        routes: {AddPlaceScreen.routeName: (ctx) => AddPlaceScreen()},
      ),
    );
  }
}
