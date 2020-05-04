import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'adaptivebutton.dart';



class NewTransaction extends StatefulWidget {

final Function addNewTrx;
NewTransaction({this.addNewTrx});

  @override
  _NewTransactionState createState(){
    print('CreateState NewTransactions widget');
   return _NewTransactionState();    
    }
}

class _NewTransactionState extends State<NewTransaction> {
final _titleTransaction = TextEditingController();

final _amaunTransaction = TextEditingController();
DateTime _selectedDate;

_NewTransactionState(){
  print('Contructor Newtransaction state');
}

@override
  void initState() {
    // TODO: implement initState
    print('Init state');
    super.initState();

  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print('didupdate widget');
    super.didUpdateWidget(oldWidget);
  }

@override
  void dispose() {
    print('dipose');
    // TODO: implement dispose
    super.dispose();
  }
void _submitData(){
  if(_amaunTransaction.text.isEmpty){
    return;
  }
final enteredTitle =  _titleTransaction.text;
final enteredAmount = double.parse(_amaunTransaction.text);
if(enteredTitle.isEmpty||enteredAmount <=0||_selectedDate==null){
  return;
}
widget.addNewTrx(
  enteredTitle, 
  enteredAmount,
  _selectedDate
);
Navigator.of(context).pop();                    

}

void _presentDataPicker(BuildContext context){
  showDatePicker(
  context: context, 
  initialDate: DateTime.now(), 
  firstDate: DateTime(2019), 
  lastDate: DateTime.now()
  ).then((pickedDte){
    if(pickedDte==null){
      return;
    }
    setState(() {
      _selectedDate=pickedDte;
    });
    
  });
}
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
          child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.only(
                    top:10, 
                    left: 10, 
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom+10
                  
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      
                       TextField(
                         onSubmitted:(_)=>_submitData() ,
                         controller: _titleTransaction,
                        //   onChanged: (value){
                        //   _titleTransaction=value;
                        // },
                         decoration: const InputDecoration(
                        labelText:'Title'
                      ),),
                      TextField(
                        // onChanged: (value){
                        //   amauntTransaction=double.parse(value);
                        // },
                        onSubmitted:(_)=>_submitData() ,
                        keyboardType: TextInputType.number,
                        controller: _amaunTransaction,
                        decoration: const InputDecoration(
                        labelText:'Amount'
                      ),),

                      Container(
                        height: 70,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                               child: Text(_selectedDate==null
                                          ?'No Date chosen!'
                                          :'Picked Date:${DateFormat.yMd().format(_selectedDate)}'),
                            ),
                         AdaptiveButton(_presentDataPicker,'Choose Date')
                          ],
                        ),
                      ),
                      RaisedButton(
                        child: Text('Add Transaction'),
                        textColor: Theme.of(context).textTheme.button.color,
                        color:Theme.of(context).primaryColor,
                        onPressed: (){                         
                            _submitData();
                        },
                      )
                    ],
                  ),
                ),
              ),
    );
  }
}