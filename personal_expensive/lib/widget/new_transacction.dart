import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'adaptivebutton.dart';



class NewTransaction extends StatefulWidget {

final Function addNewTrx;
NewTransaction({this.addNewTrx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
final _titleTransaction = TextEditingController();

final _amaunTransaction = TextEditingController();
DateTime _selectedDate;

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
                         decoration: InputDecoration(
                        labelText:'Title'
                      ),),
                      TextField(
                        // onChanged: (value){
                        //   amauntTransaction=double.parse(value);
                        // },
                        onSubmitted:(_)=>_submitData() ,
                        keyboardType: TextInputType.number,
                        controller: _amaunTransaction,
                        decoration: InputDecoration(
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