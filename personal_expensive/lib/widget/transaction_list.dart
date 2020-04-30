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
      child:transactions.isEmpty? Column(
        children: <Widget>[
          Text('No transactions added yet!',
          style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: Image.asset('assets/img/box.png',
            fit: BoxFit.cover,
            ))
        ],
      ):ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
           return Card(
             elevation: 5,
             margin: EdgeInsets.symmetric(
               vertical: 8,
               horizontal: 5
             ),
                        child: ListTile(
               leading: Container(
                 height: 60,
                 width: 60,
              
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle
              ),

                 child: Padding(
                   padding:EdgeInsets.all(6),
                   child: FittedBox(child: 
                   Text(
                     '\$${transactions[index].amount}',
                     style: TextStyle(color: Colors.white),

                   )
                   ),
                 ),
                 ),
                 title: Text(transactions[index].title,style: Theme.of(context).textTheme.title,),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date)
                ),
             ),
           );
        },
        // children: transactions.map(
        //   (transaction){ }).toList()
      ),
    );
  }
}