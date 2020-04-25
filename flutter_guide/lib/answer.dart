import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answer;
 
  Answer(this.selectHandler,this.answer);
  @override
  Widget build(BuildContext context) {
   double media =  MediaQuery.of(context).size.height*0.5;
    return Container(
        width: media,
        child: RaisedButton(
          onPressed:selectHandler,
          textColor: Colors.white,
          color: Colors.blueAccent,
          padding: EdgeInsets.all(8.0),
          child: Text(
            this.answer,
          ),
        ));
  }
}
