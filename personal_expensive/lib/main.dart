import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widget/chart.dart';

import 'model/transaction.dart';
import 'widget/new_transacction.dart';
import 'widget/transaction_list.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  // [
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expensive',
      theme: ThemeData(
        errorColor: Colors.red,
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        fontFamily: 'QuickSand',
        textTheme:ThemeData.light().textTheme.copyWith(
          title:TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          button: TextStyle(color: Colors.white)
        ) ,
        appBarTheme: AppBarTheme(
          textTheme:ThemeData.light().textTheme.copyWith(
          title:TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
        ),
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
bool _showChart = false;

List<Transaction> get _recentTransactions{
  return _userTransactions.where((tx){
    return tx.date.isAfter(
      DateTime.now().subtract(Duration(days: 7))
    );
  }).toList();
}
  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addNewTrx: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id){
    setState(() {
      
      _userTransactions.removeWhere((tx)=>tx.id==id);
    });
  }

  @override
  Widget build(BuildContext context) {
  final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;


    final appBar= AppBar(
        title: Text('Personal Expensive'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      );

      final txtListWidget = Container(
               height:(MediaQuery.of(context).size.height-appBar.preferredSize.height)*0.7,
              child: TransactionList(transactions: _userTransactions,deleteTrans:_deleteTransaction));
       
    return Scaffold(
      appBar:appBar,
      body:  _userTransactions.isEmpty? LayoutBuilder(
              builder:(ctx, constraints) {
                 return   Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('No transactions added yet!',
              style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 10,),
              Container(
                height: constraints.maxHeight*0.6,
                child: Image.asset('assets/img/box.png',
                fit: BoxFit.cover,
                ))
            ],
        ),
          );
              }
          
      ):SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           if(isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Show Chart'),
                Switch(value: _showChart, onChanged:(val){
                  setState(() {
                    _showChart=val;
                  });
                })
              ],
            ),
            if(!isLandscape)Container(
              height:(MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
              child: Chart(recentTransations: _recentTransactions,)),
              if(!isLandscape)txtListWidget,
           if(isLandscape) _showChart
            ?Container(
              height:(MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
              child: Chart(recentTransations: _recentTransactions,))
            :  txtListWidget    // TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
