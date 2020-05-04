import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';


class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTrans,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTrans;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const availableColors=[
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];

    _bgColor=availableColors[Random().nextInt(4)];
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5
      ),
                 child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
       
       decoration: BoxDecoration(
         color: _bgColor,
         shape: BoxShape.circle
       ),

          child: Padding(
            padding:const EdgeInsets.all(6),
            child: FittedBox(child: 
            Text(
              '\$${widget.transaction.amount}',
              style: TextStyle(color: Colors.white),

            )
            ),
          ),
          ),
          title: Text(widget.transaction.title,style: Theme.of(context).textTheme.title,),
         subtitle: Text(
           DateFormat.yMMMd().format(widget.transaction.date)
         ),
         trailing:MediaQuery.of(context).size.width>360? FlatButton.icon(
           
         onPressed:()=>widget.deleteTrans(widget.transaction.id),
          icon:Icon(Icons.delete), 
           label:const Text('CLEAN'),
           textColor: Theme.of(context).errorColor,
           // color: Theme.of(context).errorColor,
           ): IconButton(
           icon: const Icon(Icons.delete),
           color: Theme.of(context).errorColor, 
           onPressed: () {
                 widget.deleteTrans(widget.transaction.id);
           },),    

      ),
    );
  }
}