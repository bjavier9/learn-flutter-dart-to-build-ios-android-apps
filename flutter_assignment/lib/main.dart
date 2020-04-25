import 'package:flutter/material.dart';
import 'package:flutter_assignment/person.dart';
import './appbar.dart';

import './app.dart';

void main()=>runApp(Myapp());

class Myapp extends StatefulWidget {

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

final data = const[{
    "isActive": false,
    "balance": "\$2,993.36",
    "picture": "http://placehold.it/32x32",
    "age": 27,
    "eyeColor": "green",
    "name": "England Wells",
    "greeting": "Hello, England Wells! You have 9 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "isActive": false,
    "balance": "\$1,458.75",
    "picture": "http://placehold.it/32x32",
    "age": 34,
    "eyeColor": "brown",
    "name": "Dona Patterson",
    "greeting": "Hello, Dona Patterson! You have 7 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "isActive": true,
    "balance": "\$3,532.10",
    "picture": "http://placehold.it/32x32",
    "age": 37,
    "eyeColor": "brown",
    "name": "Holland Holder",
    "greeting": "Hello, Holland Holder! You have 10 unread messages.",
    "favoriteFruit": "banana"
  }
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:BarApp(),      
      body: App(),
      ),
    );
  }
}