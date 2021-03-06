import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPctOftotal;

  const ChartBar(this.label, this.spending, this.spendingPctOftotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains){
      
      return  Column(
      children: <Widget>[
        Container(
          height: constrains.maxHeight*0.15,
          child: FittedBox(child: Text('\$${spending.toStringAsFixed(0)}'))),
        SizedBox(
          height: constrains.maxHeight*0.05,
        ),
        Container(
          height: constrains.maxHeight*0.6,
          width: 10,
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
               
            ],
          ),
        ),
        SizedBox(
              height: constrains.maxHeight*0.05,
            ),
            Container(
              height:  constrains.maxHeight*0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
        // SizedBox(height: 12,)
      ],
    );
    });
  }
}
