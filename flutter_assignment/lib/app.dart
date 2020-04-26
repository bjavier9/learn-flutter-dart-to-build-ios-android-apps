import 'package:flutter/material.dart';
import './person.dart';
import './text.dart';
import './text_control.dart';

class App extends StatelessWidget {
 final Function handlerFunction;
 final Person person;

  const App({@required this.handlerFunction,@required this.person});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            TextCard(person:person,),
            Spacer(),
            TextControl(handlerFunction:handlerFunction ,),
            
          ],
        ),
      ),
    );
  }
}