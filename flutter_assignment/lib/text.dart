import 'package:flutter/material.dart';
import 'package:flutter_assignment/person.dart';


class TextCard extends StatelessWidget {
  final Person person;

  const TextCard({@required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0) ),
    child:Column(
      children: <Widget>[
        ListTile(
          leading: Image.network(person.picture),
          title: Text(person.name,
          style: TextStyle(
            fontSize: 30,
          fontWeight: FontWeight.bold
          ),
          ),
          subtitle: Text('${person.greeting}, Age : ${person.age}, Eye:${person.eyeColor}, fruit:${person.favoriteFruit},money:${person.balance}',
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic
          ),          
          
          ),
          ),
      ],
    ),
    );
  }
}