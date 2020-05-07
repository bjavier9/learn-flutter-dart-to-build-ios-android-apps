import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName='/meal-detail';
 Widget buildSectionTitle(BuildContext ctx,  String text){
   return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: Theme.of(ctx).textTheme.title
            ),
          );
 }

 Widget buildContainer({Widget child}){
return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150,
            width: 300,
            child:child);


 }
 
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal =DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectMeal.title),),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit:BoxFit.cover              
                ),
            ),
            buildSectionTitle(context,'Ingredients'),
           buildContainer(
           child:ListView.builder(
                itemBuilder: (ctx, index)=>Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10
                    ),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,

              ),            
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
           child:ListView.builder(
             itemBuilder: (ctx, index)=>Column(
               children: <Widget>[
                 ListTile(
                   leading: CircleAvatar(child: Text('# ${(index +1)}'),),
                   title: Text(selectMeal.steps[index]),

                 ),
                 Divider()
               ],
             ),
             itemCount: selectMeal.steps.length,
           )
           )
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}