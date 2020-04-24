import 'package:flutter/material.dart';
import './question.dart';



void main()=> runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return MyAppState();
  }
    

}  
class MyAppState extends State<MyApp>{
  int _indexArray= 0;
  void _answerQuestion(int tamano){
    setState(() {
      
      if(tamano>_indexArray){
      _indexArray++;
    }else{
      print('no se puede aumentar');
    }
    });
    
     
  }
  @override
  Widget build(BuildContext context){

    List<String> questions =[
    ' WHAT\'S THE WEATHER LIKE?',
    ' HOW\'S THE WEATHER?'
    ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:Center(child:Scaffold(
      appBar: AppBar(
        title: Text('myfirst app'),
      ),
      body: Column(children: <Widget>[
        Question(question: questions[_indexArray]),
        RaisedButton(
          child: Text('Answer 1'),
          onPressed:(){_answerQuestion(questions.length-1);},
          ),

           RaisedButton(
          child: Text('Answer 2'),
          onPressed:()=>print('hello, i\'m answer2'),
          ),
           RaisedButton(
          child: Text('Answer 3'),
          onPressed:()=>print('hello, i\'m answer3'),
          )
      ],),
    ),) ,
    );
  }
}