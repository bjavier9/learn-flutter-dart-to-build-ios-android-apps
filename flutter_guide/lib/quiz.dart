import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
 final List<Map<String, Object>> questions;
final int index;
final Function answerquestion;

Quiz({ this.questions, this.index, this.answerquestion});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Question(question: questions[index]['questionText']),
        ...(questions[index]['answers'] as List<Map<String,Object>>)
            .map((answer){
              return Answer((()=>answerquestion(answer['score'])),answer['text']);
            }).toList()
      ],);
  }
}