import 'package:flutter/material.dart';



class NewTransaction extends StatefulWidget {

final Function addNewTrx;
NewTransaction({this.addNewTrx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
final titleTransaction = TextEditingController();

final amaunTransaction = TextEditingController();

void submitData(){
final enteredTitle =  titleTransaction.text;
final enteredAmount = double.parse(amaunTransaction.text);
if(enteredTitle.isEmpty||enteredAmount <=0){
  return;
}
widget.addNewTrx(enteredTitle, enteredAmount);
Navigator.of(context).pop();                    

}

  @override
  Widget build(BuildContext context) {

    return Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    
                     TextField(
                       onSubmitted:(_)=>submitData() ,
                       controller: titleTransaction,
                      //   onChanged: (value){
                      //   titleTransaction=value;
                      // },
                       decoration: InputDecoration(
                      labelText:'Title'
                    ),),
                    TextField(
                      // onChanged: (value){
                      //   amauntTransaction=double.parse(value);
                      // },
                      onSubmitted:(_)=>submitData() ,
                      keyboardType: TextInputType.number,
                      controller: amaunTransaction,
                      decoration: InputDecoration(
                      labelText:'Amount'
                    ),),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: (){                         

                      },
                    )
                  ],
                ),
              ),
            );
  }
}