import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

final List<Transaction> transactions;

  TransactionList({ @required this.transactions});

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
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
                        color: Theme.of(context).primaryColor,
                        width: 2
                      )
                    ),
                    padding:EdgeInsets.all(10) ,
                    child: 
                    Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 20
                        ),
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        
                        Text(
                          DateFormat('yyyy/MM/dd').format(transactions[index].date),
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    )
                ],
              ),
            );
        },
        // children: transactions.map(
        //   (transaction){ }).toList()
      ),
    );
  }
}