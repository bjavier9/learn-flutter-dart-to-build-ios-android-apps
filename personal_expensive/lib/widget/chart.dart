import 'package:flutter/material.dart';


class Chart extends StatelessWidget {
 
List<Map<String, Object>>get groupedTrasaction{
return List.generate(7,(index){
final weekDay = DateTime.now().subtract(
  Duration(days: index)
);

});

}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(

      ),
    );
  }
}