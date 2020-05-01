import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

final List<Transaction> transactions;
final Function deleteTrans;
  TransactionList({ @required this.transactions,@required this.deleteTrans});

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
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
              trailing:MediaQuery.of(context).size.width>360? FlatButton.icon(
                
              onPressed:()=>deleteTrans(transactions[index].id),
               icon:Icon(Icons.delete), 
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
                // color: Theme.of(context).errorColor,
                ): IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor, 
                onPressed: () {
                      deleteTrans(transactions[index].id);
                },),    

           ),
         );
      },
      // children: transactions.map(
      //   (transaction){ }).toList()
    );
  }
}