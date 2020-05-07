import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
final List<Meal> favoriteMeals;

  const FavoritesScreen( this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
   if(favoriteMeals.isEmpty){
     return Center(
      child: Text('The favorites'),
    );
   }else{
     return ListView.builder(
          itemBuilder: (ctx, index){
              return MealItem(
                id: favoriteMeals[index].id,
                title:  favoriteMeals[index].title,
                duration:  favoriteMeals[index].duration,
                affordability:  favoriteMeals[index].affordability,
                complexity:  favoriteMeals[index].complexity,
                imageUrl:  favoriteMeals[index].imageUrl,
              );
          },
          itemCount: favoriteMeals.length 
        );
   }
    
  }
}