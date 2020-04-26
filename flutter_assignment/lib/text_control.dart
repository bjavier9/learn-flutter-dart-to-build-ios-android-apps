import 'package:flutter/material.dart';


class TextControl extends StatelessWidget {
final Function handlerFunction;

 TextControl({@required this.handlerFunction});
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      fillColor: Colors.blueAccent,
      splashColor: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.face,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Change Person",
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      onPressed: handlerFunction,
      shape: const StadiumBorder(),
    );
  }
  }
