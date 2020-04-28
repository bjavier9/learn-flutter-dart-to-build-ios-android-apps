import 'package:flutter/material.dart';
import 'package:personal_expensive/model/transaction.dart';

import 'new_transacction.dart';
import 'transaction_list.dart';


class UserTransaction extends StatefulWidget {

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
 final List<Transaction> _data =  [Transaction(
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

void _addNewTransaction(String txTitle, double txAmount ){
    final newTx = Transaction(
      amount: txAmount, 
      title: txTitle, 
      date: DateTime.now(),
      id: DateTime.now().toString()
      );

      setState(() {
       _data.add(newTx); 
      });   
}

  @override
  Widget build(BuildContext context) {
    return Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container(
            //   width: 170,
            //   child: Card(
            //     color: Colors.blue,
            //     child: Text('hola'),
            //     elevation: 5,
            //   ),
            // ),
            // NewTransaction(addNewTrx: _addNewTransaction,),
            TransactionList(transactions: _data,)

          ],
        );
  }
}