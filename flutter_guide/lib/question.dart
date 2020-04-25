import 'package:flutter/material.dart';

class Question extends StatelessWidget {
final String question;

  const Question({ this.question}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this.question,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center        
        ),
    );
  }
}