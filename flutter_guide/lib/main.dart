import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _indexArray = 0;
  int _totalScore = 0;
  void _resetApp() {
    setState(() {
      _indexArray = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    print(score);
    _totalScore += score;
    setState(() {
      _indexArray++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 1},
          {'text': 'Red', 'score': 2},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 4}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Tiger', 'score': 1},
          {'text': 'Rabbit', 'score': 2},
          {'text': 'Aligator', 'score': 3},
          {'text': 'Snake', 'score': 4}
        ]
      },
      {
        'questionText': 'What\'s your favorite actris?',
        'answers': [
          {'text': 'Lisa Han', 'score': 1},
          {'text': 'Dillion Harper', 'score': 2},
          {'text': 'Mia Khalifa', 'score': 3},
          {'text': 'Lana Rohadez', 'score': 4}
        ]
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('myfirst app'),
            ),
            body: _indexArray < _questions.length
                ? Quiz(
                    questions: _questions,
                    index: _indexArray,
                    answerquestion: _answerQuestion)
                : Result(
                    puntaje: _totalScore,
                    resetApp: _resetApp,
                  )),
      ),
    );
  }
}
