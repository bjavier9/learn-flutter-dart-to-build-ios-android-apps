import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPctOftotal;

  const ChartBar(this.label, this.spending, this.spendingPctOftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${spending.toStringAsFixed(0)}')),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 15,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border:Border.all(color:Colors.grey, width:1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOftotal,
                child: Container(
                  decoration: BoxDecoration(
                     color: Theme.of(context).primaryColor,
                     borderRadius: BorderRadius.circular(10)
                  ),
                 
                
                ),
              ),
              SizedBox(height: 10,),
              Center(child: Text(label))
            ],
          ),
        ),
        SizedBox(height: 12,)
      ],
    );
  }
}
