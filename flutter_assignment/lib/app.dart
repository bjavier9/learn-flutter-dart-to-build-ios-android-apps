import 'package:flutter/material.dart';

class App extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0) ),
      child:Column(
        children: <Widget>[
          ListTile(
            title: Text('Soy el titulo chido'),
            subtitle: Text("is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            ),
        ],
      ),
      );
  }
}