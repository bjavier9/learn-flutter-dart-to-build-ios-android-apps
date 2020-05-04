import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_item.dart';
class TransactionList extends StatelessWidget {

final List<Transaction> transactions;
final Function deleteTrans;
  TransactionList({ @required this.transactions,@required this.deleteTrans});

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index){
         return TransactionItem(transaction: transactions[index], deleteTrans: deleteTrans);
      },
      // children: transactions.map(
      //   (transaction){ }).toList()
    );
  }
}

