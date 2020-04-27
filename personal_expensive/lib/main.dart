import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

final List<Transaction> transactions =[
  Transaction(
    id:'t1', 
    title: 'New dog',
    amount: 80.99,
    date: DateTime.now()
    ),
    Transaction(
    id:'t2', 
    title: 'New gift',
    amount: 23.99,
    date: DateTime.now()
    )
];




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expensive'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 170,
              child: Card(
                color: Colors.blue,
                child: Text('hola'),
                elevation: 5,
              ),
            ),
            Column(children: transactions.map(
              (transaction){
              return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pinkAccent,
                            width: 2
                          )
                        ),
                        padding:EdgeInsets.all(10) ,
                        child: 
                        Text(
                          '\$${transaction.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                            fontSize: 20
                            ),
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transaction.title,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            
                            Text(
                              DateFormat('yyyy/MM/dd').format(transaction.date),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        )
                    ],
                  ),
                );
              }
            ).toList()
          )
          ],
        ),
      ),
    );
  }
}