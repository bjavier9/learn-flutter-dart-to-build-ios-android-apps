import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/chart_bar.dart';
import '../model/transaction.dart';


class Chart extends StatelessWidget {
  final List<Transaction> recentTransations;

  const Chart({this.recentTransations});
 
List<Map<String, Object>>get groupedTrasaction{
return List.generate(7,(index){
final weekDay = DateTime.now().subtract(
  Duration(days: index)
);
var totalSm = 0.0;
for(var i =0; i<recentTransations.length; i++){
if(recentTransations[i].date.day==weekDay.day&&
recentTransations[i].date.month==weekDay.month&&
recentTransations[i].date.year==weekDay.year){
  totalSm +=recentTransations[i].amount;
}
}
return {
  'day':DateFormat.E().format(weekDay).substring(0,1),
  'amount':totalSm
};

}).reversed.toList();

}
double get maxSpending{
 return groupedTrasaction.fold(0.0,(sum, item){
   return sum + item['amount'];
 });
}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTrasaction.map((data){
            return Flexible(
              fit: FlexFit.tight,
              flex: 2,
        child: ChartBar(
                data['day'],
                data['amount'],
               maxSpending==0.0?0.0: (data['amount']as double)/maxSpending
              ),
            );
          }).toList()
        ),
      ),
    );
  }
}